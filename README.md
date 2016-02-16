# Soliant::ContactManager

A simple contact manager CLI and REPL

## Installation

```sh
git clone https://github.com/thedeeno/soliant-contact-manager
cd soliant-contact-manager
bundle install
rake install
```

## Usage

Use the included CLI to query a CSV file. To start an interactive session with
the data provided by the client use the following:

```
contact-manager spec/fixtures/contacts.csv start
```

Once in the REPL type 'help' to see your options.

To find a contact by email type:
```sh
$> find LisaESauceda@armyspy.com
```

To query contacts for last name starting with letter type:
```sh
$> query last_name S
```

To skip the interactive session, you can call commands directly from the CLI:
```sh
contact-manager spec/fixtures/contacts.csv query last_name S
```

## Testing

This projects uses rspec for it's test suite. To run type:

```sh
bundle exec rspec spec
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

