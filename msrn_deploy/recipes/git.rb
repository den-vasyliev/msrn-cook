#
# Cookbook:: msrn-deploy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'git'

git '/opt/msrn' do
  repository 'https://github.com/den-vasyliev/msrn'
end
