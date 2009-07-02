# Extend core Mirmaid models here

Mature.class_eval do

  has_many :m2d_disease_links
  
  def test
    puts "this is a test!"
  end
  
end

# Setup plugin integration with core mirmaid framework

if defined? config
  config.to_prepare do
    MIRMAID_CONFIG.add_plugin_route :mature, :m2d_disease_link, [:one,:many]
  end
end
