def package_json_file(package, user)
  file_contents = <<-"PACKAGE"
    {
      "name": "#{package.name}",
      "version": "0.0.1",
      "description": "#{package.description}",
      "homepage": "#{package.homepage}",
      "jam": {
        "dependencies": {
        },
        "main": "#{package.name}.js",
        "include": [
          "#{package.name}.js",
          "README"
        ]
      },
      "maintainers": [
        {
          "name": "#{user.name}",
          "email": "#{user.email}"
        }
      ],
      "contributors": [
        {
          "name": "#{user.name}",
          "email": "#{user.email}"
        }
      ],
      "bugs": {
        "mail": "dev@example.com",
        "web": "http://www.example.com/bugs"
      },
      "licenses": [
        {
          "type": "MIT",
          "url": "http://www.opensource.org/licenses/mit-license.php",
        }
      ],
      "repositories": [
        {
          "type": "git",
          "url": "http://github.com/example/example.git"
        }
      ],
      "github": "http://github.com/example/example"
    }
  PACKAGE

  file_contents
end
