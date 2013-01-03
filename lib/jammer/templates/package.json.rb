module Jammer
  PACKAGE_JSON = <<-PACKAGE
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
      "repositories": [
        {
          "type": "git",
          "url": "http://github.com/example/example.git"
        }
    ],
      "github": "http://github.com/example/example"
  }
  PACKAGE
end
