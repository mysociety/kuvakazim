# KuvakaZim [![Build Status](https://travis-ci.org/mysociety/kuvakazim.svg?branch=travis)](https://travis-ci.org/mysociety/kuvakazim)

This is the source code for KuvakaZim, a Parliamentary Monitoring website in Zimbabwe.

## Installation

You'll need to have Ruby 2+ and [Bundler](http://bundler.io) installed on your machine before proceeding.

Get the code from GitHub

    $ git clone https://github.com/mysociety/kuvakazim
    $ cd kuvakazim

Install the dependencies with bundler

    $ bundle install

## Usage

Once you've installed the code you can start a server using jekyll

    $ bundle exec jekyll serve -w

This will start a webserver running at <http://localhost:4000>.

## Deploying

This site is hosted on [GitHub pages](https://pages.github.com). However instead of pushing directly to the GitHub pages branch you should instead create a pull request against the `master` branch. When your pull request gets merged in a build will run on [Travis CI](https://travis-ci.org), this will take the code from the master branch, build it and push it to the `gh-pages` branch for you. The reason for doing this is so that we can use [Jekyll plugins](http://jekyllrb.com/docs/plugins/) on the site.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mysociety/kuvakazim.
