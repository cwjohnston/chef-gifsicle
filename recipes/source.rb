#
# Cookbook Name:: gifsicle
# Recipe:: source
#
# Copyright (C) 2013 Cameron Johnston
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

version = node[:gifsicle][:version]

include_recipe "build-essential"

execute "build and install gifsicle-#{version}" do
  command "./configure --prefix=#{node[:gifsicle][:install_prefix]} && make install"
  cwd ::File.join(node[:gifsicle][:build_prefix],"gifsicle-#{version}")
  action :nothing
end

execute "unpack gifsicle-#{version}" do
  command "tar -xvf gifsicle-#{version}.tar.gz"
  cwd node[:gifsicle][:build_prefix]
  notifies :run, "execute[build and install gifsicle-#{version}]", :immediately
  action :nothing
end

remote_file ::File.join(node[:gifsicle][:build_prefix],"gifsicle-#{version}.tar.gz") do
  source node[:gifsicle][:source_url]
  checksum node[:gifsicle][:source_sha256]
  notifies :run, "execute[unpack gifsicle-#{version}]", :immediately
end
