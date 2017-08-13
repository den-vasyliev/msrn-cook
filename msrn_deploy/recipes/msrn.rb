#
# Cookbook:: msrn-deploy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Pull latest image
docker_image 'msrn/msrn-prod' do
  tag 'latest'
  action :pull
end

# Run container exposing ports
docker_container 'msrn' do
  repo 'msrn/msrn-prod'
  tag 'latest'
  env 'REDIS_SERVER=172.31.27.185:6379'
  port '35001:35001'
  action :redeploy
end
