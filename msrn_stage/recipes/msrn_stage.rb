#
# Cookbook:: msrn-deploy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Pull latest image
docker_service 'default' do
  action [:create, :start]
end

docker_image 'msrn/msrn-pre-prod' do
  tag 'latest'
  action :pull
end

# Run container exposing ports
docker_container 'msrn' do
  repo 'msrn/msrn-pre-prod'
  tag 'latest'
  env 'REDIS_SERVER=172.31.42.71:6379'
  port '35001:35001'
  action :redeploy
end
