require 'cucumber'
require_relative 'cucumber/runtime'
module Flatware
  module Cucumber
    autoload :Formatter, 'flatware/cucumber/formatter'

    extend self
    def features
      @features ||= `find features -name '*.feature' | xargs grep -Hn Scenario: | cut -f '1,2' -d ':'`.split "\n"
    end

    def run(feature_files=[])
      runtime.run feature_files
    end

    def runtime
      @runtime ||= Runtime.new
    end
  end
end
