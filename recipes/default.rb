#
# Cookbook Name:: jenkins-delivery-demo
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt'
include_recipe 'java'
include_recipe 'jenkins::master'

packagecloud_repo 'chef/stable'

package 'git'
package 'delivery-cli'

chef_dk 'jenkins_chefdk'

%w(ghprb git).each do |plugin|
  jenkins_plugin plugin
  notifies :restart, 'service[jenkins]'
end

jenkins_user 'chef'