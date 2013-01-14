require 'erb'
require 'jammer/user'

module Jammer
  class PackageCreator
    def initialize(file_utils = FileUtils, user = Jammer::User.new)
      @file_utils = file_utils
      @user = user
    end

    def create_package(package_info)
      prepare_directory package_info.name
      create_dir package_info.name
      create_files package_info, @user
    end

    def prepare_directory(name)
      remove_dir(name) if File.exists? name
    end

    def remove_dir(name)
      @file_utils.rm_rf name, verbose: true, secure: true
    end

    def create_dir(name)
      @file_utils.mkdir_p name
    end

    def create_files(package, user)
      templates.each do |template_name|
        template_file = File.join(File.dirname(__FILE__), 'templates', template_name)
        file_name = File.basename template_file, '.erb'
        destination = file_destination package.name, file_name
        template = ERB.new(File.read(template_file))

        write_file(destination, template.result(binding))
      end
    end

    def file_destination(package_name, file_name)
      file_name.sub! 'main', package_name
      File.join Dir.pwd, package_name, file_name
    end

    def templates
      puts '==========='
      puts 'templates: '
      Dir.entries(File.join(File.dirname(__FILE__), 'templates')).tap {|x| puts x; puts '============' }.delete_if { |x| x == '.' || x == '..' }
    end

    def write_file(file_destination, file_contents)
      File.open(file_destination, 'w') { |file| file.write file_contents }
    end
  end
end
