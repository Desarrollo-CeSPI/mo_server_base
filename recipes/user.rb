include_recipe "users"
include_recipe "sudo"

node.override[:authorization][:sudo][:passwordless] = node[:cespi_server_base][:authorization][:sudo][:passwordless]

users_manage "sysadmin" do
  group_id 1200
  action :create
end

users_manage "devops" do
  group_id 1201
  action :create
end
