# Psp

Command line utility for project and plugins spec running.

:warning: The main difference from original repo – project independent modifications
and realization of truly author ideas :warning:

## Features

1. Fair parallelism: all specs running in real processes
2. KISS: all you should know is what you want to test
3. PP: pretty console output
4. Shit free :poop:
5. This tool is made with love :heart:

## Installation

Add this line to your application's `Gemfile`:

    gem 'psp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install psp

Ensure that your `test` section in `database.yml` looks like this:

```yaml
test:
  adapter: postgresql
  database: db_name_test<%= ENV['TEST_DATABASE_POSTFIX'] %>
  username: db_user
  host: localhost
  port: 5432
  pool: 10
```

Increase the pools size up to `10` and add `<%= ENV['TEST_DATABASE_POSTFIX'] %>`
to your database name

## Usage

From root of your project

    $ psp -h
    $ Parallel specs
    $ Usage: psp [options]
    $   -p, --project                    Run all project specs
    $   -g, --plugins                    Run all plugins specs
    $   -l, --plugin=<plugin1,...>       Run specified plugins specs
    $   -j, --jobs=<concurrency>         Set runner concurrency
    $       --dry-run                    Check out the allocations
    $   -v, --verbose                    Turn on verbosity
    $   -d, --debug                      Turn on debug verbosity
    $       --version                    Display the version
    $   -h, --help                       You are looking at it

## Contributing

1. Fork it ( https://github.com/abak-press/psp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
