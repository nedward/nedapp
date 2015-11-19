#
# Cookbook Name:: nedapp
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'apt'
include_recipe 'jenkins::master'

service 'jenkins' do
  supports :status => true, :start => true, :stop => true, :restart => true 
  action [:enable, :start]
end

jenkins_plugin 'git' do
  notifies :restart, 'service[jenkins]', :immediately
end
