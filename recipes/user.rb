include_recipe "users"

users_manage node[:cespi_server_base][:authorization][:superadmin_group] do
  group_id 1200
  action :create
end

users_manage "devops" do
  group_id 1201
  action :create
end

node.override['authorization']['sudo']['passwordless'] = node[:cespi_server_base][:authorization][:sudo][:passwordless]
include_recipe "sudo"
