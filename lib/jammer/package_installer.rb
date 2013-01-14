module Jammer
  class PackageInstaller
    def install_packages
      packages = get_packages
      puts packages
    end

    def get_packages
      package_file.scan(/jam\s(.*),\s(.*)/)
    end

    def package_file
      @package_file ||= File.read('Jamfile')
    end
  end
end
