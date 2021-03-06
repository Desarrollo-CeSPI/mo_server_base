node.override['ubuntu']['archive_url'] = node['mo_server_base']['mirror']['archive_url']
node.override['ubuntu']['archive_url_src'] = node['mo_server_base']['mirror']['archive_url_src']
node.override['ubuntu']['security_url'] = node['mo_server_base']['mirror']['security_url']
node.override['ubuntu']['security_url_src'] = node['mo_server_base']['mirror']['security_url_src']
include_recipe 'ubuntu::default'

begin
  t = resources(:template => '/etc/apt/sources.list')
  t.source 'sources.list.erb'
  t.cookbook 'mo_server_base'
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn 'could not find template /etc/apt/sources.list to modify'
end
