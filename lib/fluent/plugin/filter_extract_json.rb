require 'fluent/filter'
require 'oj'

module Fluent
  class ExtractJsonFilter < Filter
    Fluent::Plugin.register_filter('extract_json', self)

    config_param :key, :string,
                 desc: <<-DESC
Key of extracting JSON object.
DESC

    def configure(conf)
      super
    end

    def filter(tag, time, record)
      Oj.load(record[@key])
    end
  end
end
