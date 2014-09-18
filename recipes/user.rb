include_recipe "users"

users_manage "devops" do
  group_id 1200
  action :create
end

users_manage "prodadm" do
  group_id 1201
  action :create
end
