#
# Cookbook:: mongo
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# ---------CHEF WAY TO INSTALL (NOT YET WORKING)
# imports of recipes
# include_recipe 'apt'
# include_recipe 'build-essential'
#
# apt_repository - sourcelist add
# apt_repository 'mongodb' do
#   uri 'http://repo.mongodb.org/apt/ubuntu/dists/xenial/mongodb-org'
#   components ['main']
#   deb_src true
#   distribution 'xenial'
#   key 'D68FA50FEA312927'
#   # key_proxy
#   keyserver 'hkp://keyserver.ubuntu.com:80'
#   # repo_name
#   trusted true
#   action :add
# end
#
# # apt package install
# apt_update
#
# package 'mongodb' do
#   # allow_downgrade true
#   # version '3.2.2'
#   action :upgrade
# end
#
# # mongodb service
# service 'mongodb' do
#   action [:start, :enable]
# end
# --------- BASH COMMANDS FOR MONGODB INSTALL
execute 'mongodb_apt_key' do
  command 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927'
  action :run
end

execute 'mongodb_update_sourcelist' do
  command 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list'
  action :run
end

execute 'mongodb_apt_update' do
  command 'sudo apt-get update -y'
  action :run
end

execute 'mongodb_apt_upgrade' do
  command 'sudo apt-get upgrade -y'
  action :run
end

execute 'mongodb_install' do
  command 'sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20'
  action :run
end

execute 'mongod_provision_script' do
  command 'sudo systemctl restart mongod'
  action :run
end

execute 'mongod_provision_script' do
  command 'sudo systemctl enable mongod'
  action :run
end
