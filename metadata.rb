name             "newrelic"
maintainer       "Escape Studios"
maintainer_email "dev@escapestudios.com"
license          "MIT"
description      "Installs/Configures New Relic"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.5.7"

%w{ debian ubuntu redhat centos fedora scientific amazon windows smartos }.each do |os|
supports os
end

recommends "curl"

recipe "newrelic::default", "Adds the New Relic repository, installs & configures the New Relic server monitor package."
recipe "newrelic::repository", "Adds the New Relic repository."
recipe "newrelic::server-monitor", "Installs & configures the New Relic server monitor package."
recipe "newrelic::php-agent", "Installs the New Relic PHP agent."
recipe "newrelic::python-agent", "Installs the New Relic Python agent."
recipe "newrelic::dotnet", "Installs New Relic .NET Agent"

attribute "newrelic/server_monitoring/license",
  :display_name => "New Relic Server Monitoring License", 
  :description => "New Relic Server Monitoring License",
  :required => "required",
  :recipes => [ "newrelic::default", "newrelic::server-monitor" ]

attribute "newrelic/application_monitoring/license",
  :display_name => "New Relic App Monitoring License",
  :description => "New Relic App Monitoring License",
  :required => "required",
  :recipes => [ "newrelic::php-agent" ]
