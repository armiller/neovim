#
# Cookbook Name:: neovim
# Recipe:: _install_source
#
# Copyright 2016 Anthony Miller
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'git'

# Install build depends
node['neovim']['build_dependencies'].each { |p| package p }

path = ::File.join(Chef::Configp[:file_cache_path], 'neovim')
directory path do
  recursive true
end

git 'neovim' do
  repository 'https://github.com/neovim/neovim.git'
  revision node['neovim']['version']
end

execute 'make-neovim' do
  command 'make'
  cwd path
  not_if "nvim --version | grep #{version}"
end

execute 'install-neovim' do
  command 'make install'
  cwd path
  not_if "nvim --version | grep #{version}"
end
