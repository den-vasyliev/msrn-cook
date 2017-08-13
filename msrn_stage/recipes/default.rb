#
# Cookbook:: msrn_stage
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'msrn_stage::msrn_stage'
include_recipe 'chef-client::delete_validation'
