#
# Cookbook:: mongo
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongo::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it'should execute mongodb_install bash command' do
      expect(chef_run).to run_execute 'mongodb_install'
      expect(chef_run).to run_execute 'mongod_provision_script'
    end

    # it'should install mongodb version 3.2.2' do
    #   is_expected(chef_run).to install_package('mongodb').with(version: starts_with("3.2"))
    # end

  end

  # context 'When all attributes are default, on CentOS 7' do
  #   # for a complete list of available platforms and versions see:
  #   # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
  #   platform 'centos', '7'
  #
  #   it 'converges successfully' do
  #     expect { chef_run }.to_not raise_error
  #   end
  # end
end
