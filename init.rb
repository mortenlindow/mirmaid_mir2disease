# Include hook code here

require File.dirname(__FILE__) + '/mirmaid_models'

config.to_prepare do
  MIRMAID_CONFIG.add_plugin_route :mature, :m2d_disease_link, [:one,:many]
end
