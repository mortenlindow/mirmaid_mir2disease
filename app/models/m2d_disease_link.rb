# == Schema Information
#
# Table name: m2d_disease_links
#
#  id             :integer         not null, primary key
#  mature_id      :integer
#  m2d_disease_id :integer
#  mirna          :string(255)
#  expression     :string(255)
#  method         :string(255)
#  description    :text
#  year           :integer
#  pmid           :integer
#  causal         :string(255)
#  genes          :string(255)
#


class M2dDiseaseLink < ActiveRecord::Base
  belongs_to :m2d_disease
  belongs_to :mature
  
  def self.find_rest(id)
    self.find(id)
  end
  
end
