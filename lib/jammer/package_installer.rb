module Jammer
  class PackageInstaller

    JAM_PACKAGE_REGEX = /jam\s[\'\"](\w+)[\'\"](?:,\s['"](.*)['"])?/

    def install_packages
      packages.each do |package|
        puts "installing #{package}"
        `jam install #{package.first}#{"@" + package.last if package.last}`
      end
    end

    def packages
      @packages ||= get_packages
    end

    def get_packages
      package_file.scan(JAM_PACKAGE_REGEX)
    end

    def package_file
      @package_file ||= File.read('Jamfile')
    end

  end
end
