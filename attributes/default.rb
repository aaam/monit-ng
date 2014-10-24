#
# Cookbook Name: monit-ng
# Attributes: default
#

default['monit'].tap do |monit|

  # one of: repo, source
  monit['install_method'] = 'repo'

  # should we setup the global config
  monit['configure'] = true

  # configure default service_provider
  monit['service_provider'] = Chef::Platform.find_provider_for_node node, :service

  # configuration file location
  monit['conf_file'] = value_for_platform_family(
    'rhel'    => '/etc/monit.conf',
    'debian'  => '/etc/monit/monitrc',
    'default' => '/etc/monitrc',
  )

  # includes directory (used by monit_check resource)
  monit['conf_dir'] = value_for_platform_family(
    'rhel'    => '/etc/monit.d',
    'debian'  => '/etc/monit/conf.d',
    'default' => '/etc/monit.d',
  )
end
