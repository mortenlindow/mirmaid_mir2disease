require 'progressbar'
require 'activerecord'
require 'pp'

plugin_root = File.join(File.dirname(__FILE__), "..")
app_root = File.join(plugin_root, "..", "..", "..")
datafile = plugin_root+"/data/mir2dis.txt"


# gene.diseases
# disease.genes
# disease.mirnas
# mirna.diseases

namespace :mirmaid do
  namespace :plugin do
    namespace :mir2disease do

      task :test do
        puts "this is a test!!!"
      end        

      desc "create plugin schema"
      task :create_schema => :environment do
        ActiveRecord::Migration.verbose = false
        conn = ActiveRecord::Base.connection
        
        conn.create_table(:m2d_diseases) do |t|
          t.column :doid, :integer
          t.column :name, :string
        end
        
        conn.create_table(:m2d_disease_links) do |t|
          t.column :mature_id, :integer
          t.column :m2d_disease_id, :integer
          t.column :mirna, :string
          t.column :expression, :string
          t.column :method, :string
          t.column :description, :text
          t.column :year, :integer
          t.column :pmid, :integer
          t.column :causal, :string
          t.column :genes, :string      
        end
        
        #indexes
        conn.add_index :m2d_diseases, :doid, :unique => true
        conn.add_index :m2d_disease_links, :mature_id
        conn.add_index :m2d_disease_links, :m2d_disease_id
    
      end
      
      desc "drop plugin schema"
      task :drop_schema => :environment do
        ActiveRecord::Migration.verbose = false
        conn = ActiveRecord::Base.connection
        begin
          conn.drop_table(:m2d_diseases)
          conn.drop_table(:m2d_disease_links)
        rescue
          # nothing to drop
        end
      end

      desc "install plugin"
      task :install => ['mir2disease:drop_schema',
                        'mir2disease:create_schema',
                        'mir2disease:load_data']

      desc "uninstall plugin"
      task :uninstall => ['mir2disease:drop_schema']
      
      
      desc "load mir2disease data"
      task :load_data => :environment do
        
        verbose = false
        skipped_rows = 0
        
        rows = IO.readlines(datafile)
        
        col = Hash.new()
        rows.shift.split("\t").each_with_index{|h,idx| col[h.chomp.strip] = idx}
        # miRNA   DOID    Disease Expression      Method  Description target tarbase Years   PMID    Causal
        
        pbar = ProgressBar.new("loading",rows.size)
        rows.each_with_index do |row,idx|
          # split and remove newline, whitespace and plings
          r = row.split("\t").map{|x| x.chomp.strip.gsub(/^"/,'').gsub(/"$/,'')}
          if r.select{|x| x!=""}.size != col.size
            puts "warning : data row #{idx+2} has wrong number of fields : #{r.select{|x| x!=''}.size}" if verbose
            skipped_rows +=1
            next
          end
      
          # look up miRNA
          mats = Mature.find_best_by_name(r[col['miRNA']]) 
          
          if mats.nil? or mats.empty?
            puts ("warning : could not match '" + r[col['miRNA']]+ "'") if verbose
            skipped_rows +=1
            next
          end
          
          # look up disease - create if new
          
          disease = M2dDisease.find_or_create_by_doid(r[col['DOID']].to_i) {|d| d.name = r[col['Disease']]}
          next if disease.nil?
          
          # create disease link
          mats.each do |mat|
            dl = M2dDiseaseLink.new()
            dl.mirna = r[col['miRNA']]
            dl.expression = r[col['Expression']]
            dl.method = r[col['Method']]
            dl.description = r[col['Description']].toutf8
            dl.year = r[col['Years']].to_i
            dl.pmid = r[col['PMID']].to_i
            dl.causal = r[col['Causal']]
            dl.genes = r[col['target']].toutf8
            dl.m2d_disease = disease
            dl.mature = mat
            dl.save
          end
          
          pbar.inc
        end
        pbar.finish
        
        puts "finished loading, skipped #{skipped_rows}/#{rows.size} unparsable entries"
        
      end
      
    end
  end
end

