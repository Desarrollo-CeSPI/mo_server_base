include_recipe "users"

Array(node[:mo_server_base][:authorization][:superadmin_group]).each do |group|
  users_manage group do
    action :create
  end
end


node.set['authorization']['sudo']['passwordless'] = node[:mo_server_base][:authorization][:sudo][:passwordless]
node.set['authorization']['sudo']['include_sudoers_d'] = node[:mo_server_base][:authorization][:sudo][:include_sudoers_d]
node.set['authorization']['sudo']['groups'] = Array(node[:mo_server_base][:authorization][:superadmin_group])
include_recipe "sudo"
