default['php']['ext_conf_dir']='/etc/php.d'
if %{ubuntu debian}.include?(node['platform'])
  default['php']['ext_conf_dir']='/etc/php5/conf.d'
end
