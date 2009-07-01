# Include hook code here

require File.dirname(__FILE__) + '/mirmaid_models'

# dir1<->dir2 : one<->many
# guess method name, dir2 == one ? class : class.pluralize
# :method=>:m2d_disease_links
# guess title as well

config.to_prepare do
  MIRMAID_CONFIG.add_plugin_route :mature, :m2d_disease_link, [:one,:many]
end
