require 'jammer/version'
require 'jammer/package_info'
require 'jammer/package_creator'
require 'jammer/package_installer'
require 'jammer/package_manager'
require 'jammer/package_publisher'

module Jammer
  class << self
    def create_package(package_info)
      creator.create_package package_info
    end

    def bump_package(version_level)
      puts "TODO: implement version bumping"
    end

    def publish_package(package_location, package_info, repository = nil)
      publisher.publish_package package_location, package_info, repository
    end

    def install_packages
      installer.install_packages
    end

    def creator(default = Jammer::PackageCreator.new)
      @creator ||= default
    end

    def installer(default = Jammer::PackageInstaller.new)
      @installer ||= default
    end

    def manager(default = Jammer::PackageManager.new)
      @manager ||= default
    end

    def publisher(default = Jammer::PackagePublisher.new)
      @publisher ||= default
    end
  end
end
