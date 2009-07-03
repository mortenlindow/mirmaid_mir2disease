require 'plugin_config' # in lib/

eval(IO.read(File.dirname(__FILE__)+"/plugin_routes.rb"))
