require 'cucumber/formatter/progress'

module Cucumber
  module Formatter
    class Timed < Progress
      def initialize(*args)
        @duration = 0.0
        super
      end

      def before_steps(steps)
        @my_time = Time.now
      end

      def after_steps(steps)
        @duration += Time.now - @my_time
      end

      def after_feature_element(scenario)
        $stdout.puts " #{scenario.name} (#{@duration}s)"
        @duration = 0.0
      end
    end
  end
end
