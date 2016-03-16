sudo chef-server-ctl user-create ${chef-server-user} ${chef-server-user-full-name} ${chef-server-user-email} ${chef-server-user-password} -f ~/${chef-server-user}.pem
sudo chef-server-ctl org-create ${chef-server-org-name} ${chef-server-org-full-name} -f ~/${chef-server-org-name}.pem -a ${chef-server-user}
echo "oc_id[\"administrators\"] = [\"${chef-server-user}\"]" >> /etc/opscode/chef-server.rb
echo "oc_id[\"applications\"] = { \"supermarket\" => { \"redirect_uri\" => \"${supermarket-redirect-uri}\" } }" >> /etc/opscode/chef-server.rb
sudo chef-server-ctl reconfigure

