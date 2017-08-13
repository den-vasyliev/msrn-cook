#
# Cookbook:: msrn-deploy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
docker_service 'default' do
  action [:create, :start]
end
include_recipe 'msrn_deploy::msrn'
