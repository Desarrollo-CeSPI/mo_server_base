include_recipe "users"

users_manage node[:mo_server_base][:authorization][:superadmin_group] do
#  group_id 1200
  action :create
end

users_manage "devops" do
#  group_id 1201
  action :create
end

node.override['authorization']['sudo']['passwordless'] = node[:mo_server_base][:authorization][:sudo][:passwordless]
node.override['authorization']['sudo']['include_sudoers_d'] = node[:mo_server_base][:authorization][:sudo][:include_sudoers_d]
include_recipe "sudo"
