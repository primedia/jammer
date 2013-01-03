Jammer
======

Jammer provides a Ruby-based executable for managing Jam packages, 'cause let's be honest: JS is nice, but JS wrapped up with some Ruby is at least twice as nice. Jammer provides the ability to easily create, update, and publish Jam packages with a convenient command line interface.

Dependencies
------------

* Ruby 1.9+ - http://ruby-lang.org
* Jam - http://jamjs.org
* Git - http://git-scm.com

Installation
------------

0. Install Jam. NPM is recommended. `npm install -g jamjs` will install it globally if you have NPM.

1. `gem install jammer` *You may need to preface this commmand with `sudo` depending on your Ruby installation*


Usage
-----

### Creating a New Package

To create a new jam package:

    jammer new [package_name]

This will prompt you for some basic information about the package (which you can always change later) and then create a new directory with the given name. Inside that directory will be the necessary structure for a basic jam package. The most important file created by this command is the `package.json` file.

Running `jammer new test-lib` and providing the responses

    Package description ('The test-lib package'): This is a description for the test-lib.
    Package homepage (''): http://github.com/crymer11/test-lib

would result in a `package.json` file that looks like this:

    {
      "name": "test-lib",
      "version": "0.0.1",
      "description": "This is a description for the test-lib.",
      "homepage": "http://github.com/crymer11/test-lib",
      "jam": {
        "dependencies": {
        },
        "main": "test-lib.js",
        "include": [
          "test-lib.js",
          "README"
        ]
      },
      "maintainers": [
        {
          "name": "Colin Rymer",
          "email": "colin.rymer@gmail.com"
        }
      ],
      "contributors": [
        {
          "name": "Colin Rymer",
          "email": "colin.rymer@gmail.com"
        }
      ],
      "repositories": [
        {
          "type": "git",
          "url": "http://github.com/crymer11/test-lib.git"
        }
      ],
      "github": "http://github.com/crymer11/test-lib"
    }

Note that the github attribute was set based on the detection of a github package homepage. If the homepage is not a github url, then the repositories attribute will be left empty and the github attribute will not be added.

### Publishing a Package

To publish the package, run `jammer publish`. This command will exit with an error message if not on the master branch of a repository. If it is on the master branch, it will create a tag for the version number and publish the code to the repository specified in your `.jamrc` file.

If the `jammer publish` command is run and the version number has not been updated, either manually or with `jammer bump major`, `jammer bump minor`, or `jammer bump patch`, then the command will exit with an error message specifying the version issue.

### Updating a Package

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Authors
-------

* Colin Rymer

Acknowledgement
---------------
Huge thanks [Primedia](http://primedia.com) for encouraging open source contributions.
