Brunch Finder - Buenos Aires
========

_Find the brunch you deserve_

![Brunch Finder home page](screenshots/homepage.png "Brunch Finder home page")

To run the development environment for this project you will need to have [Git](https://git-scm.com/), [Ruby](https://www.ruby-lang.org/en/) and [Rails](http://rubyonrails.org/) installed.

## Table of contents

- [Contributing](#contributing)
- [Getting Started](#getting-started)
- [Frequently Asked Questions](#frequently-asked-questions)

## Contributing

[![Travis](https://travis-ci.org/whensbrunch/brunch-finder.svg)](https://travis-ci.org/whensbrunch/brunch-finder)

Contributions are welcome via pull requests and issues.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## Frequently Asked Questions
