# fluent-plugin-extract-json

fluent-plugin-extract-json is fluentd filter plugin extracts single JSON object from record.

![Build Status](https://travis-ci.org/neguse/fluent-plugin-extract-json.svg?branch=master)

## Installation

```
fluent-gem install fluent-plugin-extract-json
```

## Configure

```
<filter **>
  @type extract_json
  key jsonkey
</filter>
```

## Example

```
INPUT:  {"jsonkey" => '{"a":1}', "notjsonkey" => 'ignored'}
CONFIG: key jsonkey
OUTPUT: {"a" => 1}
```

## Development

To test, run below commands.

```
$ bundle install
$ bundle exec rake
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/neguse/fluent-plugin-extract-json.

 ## License
 The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
