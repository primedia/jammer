require 'jammer/version'
require 'jammer/package_creator'
require 'jammer/package_info'
require 'fileutils'

module Jammer
  class << self
    def create_package(package_info)
      @creator =Jammer::PackageCreator.new
      @creator.create_package package_info
    end

    def bump_package(version_level)
      puts "TODO: implement version bumping"
    end

    def publish(package)

    end

    def install_packages
      @installer = Jammer::PackageInstaller.new
      @installer.install_packages
    end
  end
end
