data = encrypted_data_bag_item node['mo_server_base']['mail']['databag'], node['mo_server_base']['mail']['mail_id']

node.override['postfix'] = Hash.new unless node['postfix']
node.override['postfix']['main'] = Hash.new unless node['postfix']['main']
node.override['postfix']['sasl'] = Hash.new unless node['postfix']['sasl']
node.override['postfix']['main']['mydomain'] = "$myhostname"
node.override['postfix']['main']['relayhost'] = data["address"]
node.override['postfix']['sasl']['smtp_sasl_user_name'] = data["username"]
node.override['postfix']['sasl']['smtp_sasl_passwd'] = data["password"]

include_recipe 'postfix::default'
