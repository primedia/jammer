module Jammer
  class PackageInfo

    attr_reader :name, :description, :url

    def initialize(package_name, package_desc, package_url)
      @name, @description, @url = package_name, package_desc, package_url
    end

    def repo_url
      on_github? ? "#{url}.git" : ''
    end

    def repo_type
      on_github? ? 'git' : ''
    end

    def on_github?
      url.include? 'github.com'
    end
  end
end
