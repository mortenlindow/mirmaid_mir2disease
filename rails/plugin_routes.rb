# Setup plugin integration with core mirmaid framework

config.to_prepare do
  # TODO : register menu items
  MIRMAID_CONFIG.add_plugin_route :mature, :m2d_disease_link, [:one,:many]
end
