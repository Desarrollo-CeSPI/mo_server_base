def mo_server_base_superadmin_users(attribute="id")
  data_bag('users').map do |user|
    data_bag_item('users', user)
  end.select do |user|
    user["groups"].include? node[:mo_server_base][:authorization][:superadmin_group]
  end.map do |user|
    user[attribute] || user["id"]
  end
end
