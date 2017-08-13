#
# Cookbook:: msrn-deploy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Pull latest image
docker_image 'nginx' do
  tag 'latest'
  action :pull
end

bash 'nginx.conf' do
  code <<-EOH
  HOST_IP=$($(which curl) -s http://169.254.169.254/latest/meta-data/local-ipv4/)
  $(which sed) s/==HOST_IP==/${HOST_IP}/ > /opt/msrn/src/conf/nginx.conf < /opt/msrn/src/conf/nginx.tmpl
  EOH
end

# Run container exposing ports
docker_container 'nginx' do
  repo 'nginx'
  tag 'latest'
  port '80:80'
  volumes ['/opt/msrn/src/conf:/etc/nginx', '/opt/msrn/src/media:/etc/nginx/html/media']
  action :redeploy
end
