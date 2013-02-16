require 'erb'
require 'fileutils'
require 'jammer/user'

module Jammer
  class PackageCreator
    attr_reader :package

    def initialize(file_utils = FileUtils, user = Jammer::User.new)
      @file_utils = file_utils
      @user = user
    end

    def create_package(package_info)
      @package = package_info
      prepare_directory
      create_files
    end

    def prepare_directory
      remove_dir(package.name) if File.exists? package.name
    end

    def remove_dir(name)
      @file_utils.rm_rf name, verbose: false, secure: true
    end

    def create_files
      create_directory base_destination_dir, base_template_dir
    end

    def create_directory(destination, template_dir)
      make_dir destination
      write_files destination, template_dir
    end

    def make_dir(name)
      @file_utils.mkdir_p name
    end

    def write_files(destination, template_dir)
      templates(template_dir).each do |template|
        template_file = File.join(template_dir, template)
        if File.directory?(template_file)
          dir = file_path(destination, template)
          create_directory(dir, template_file)
        else
          create_file destination, template_file
        end
      end
    end

    def create_file(destination, template_file)
      file_destination = file_path(destination, file_name(template_file))
      template = ERB.new(File.read(template_file))
      write_file(file_destination, render(template))
    end

    def render(template)
      template.result(template_binding)
    end

    def template_binding
      @binding ||= get_binding(@package, @user)
    end

    def get_binding(package, user)
      Kernel.binding
    end

    def file_name(file)
      File.basename file, '.erb' #strip ".erb" off template file name
    end

    def file_path(dir, file_name)
      file_name.sub! 'main', package.name
      File.join dir, file_name
    end

    def templates(dir)
      Dir.entries(dir).delete_if(&dot_dir)
    end

    def base_template_dir
      File.join(File.dirname(__FILE__), 'templates')
    end

    def base_destination_dir
      File.join Dir.pwd, package.name
    end

    def dot_dir
      ->(dir) { dir == '.' || dir == '..' }
    end

    def write_file(file_destination, file_contents)
      File.open(file_destination, 'w') { |file| file.write file_contents }
    end
  end
end
