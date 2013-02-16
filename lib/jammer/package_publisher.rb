require 'json'

module Jammer
  class PackagePublisher

    def publish_package(package_location, package_info, repository = nil)
      tag_name = "#{package_info.name}-v#{package_info.version}"
      tag_message = "#{package_info.name} version #{package_info.version}"
      repository_string = repository ? " --repository #{repository}" : ''
      puts 'Compiling coffeescript...'
      `coffee -c --output #{package_location} #{package_location}/src`

      puts `jam publish --no-auth #{package_location}#{repository_string}`
      puts "Creating tag: #{tag_name}"
      `git tag -a #{tag_name} -m '#{tag_message}'`
      puts `git push --tags`
    end

  end
end
