module Jammer
  class PackageInfo
    attr_reader :name, :description, :version, :url

    def initialize(package_name, package_desc, package_url, package_version = nil)
      @name, @description, @version, @url = package_name, package_desc, package_version, package_url
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

    def self.fromJSON(json_string)
      package = JSON.parse json_string
      new(package['name'], package['description'], nil, package['version'])
    end
  end
end
