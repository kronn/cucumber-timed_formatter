require 'cucumber/formatter/progress'

# Extend Cucumber's builtin formats, so that this
# formatter can be used with --format timed
require 'cucumber/cli/options'

Cucumber::Cli::Options::BUILTIN_FORMATS['timed'] = [
  "Cucumber::Formatter::Timed",
  "A progress-formatter with a little more info, instafailing and line-wise output"
]

module Cucumber
  module Formatter
    class Timed < Progress
      def initialize(step_mother, io, options)
        @io = io
        @duration = 0.0
        super
      end

      def before_feature(feature)
        @io.puts "#{feature.name.lines.first.chomp} [#{feature.file}]"
      end

      def before_steps(steps)
        @my_time = Time.now
      end

      def after_steps(steps)
        @duration += Time.now - @my_time
      end

      def after_test_step(test_step, result)
        super(test_step, result)

        unless result.ok?
          error_msg = "#{result.exception.message} (#{result.exception.class.name})\n#{result.exception.backtrace.join("\n")}"

          @io.puts <<-EOMESSAGE

#{format_string(test_step.action_location, :comment)}

#{format_string(error_msg, result.to_sym)}

          EOMESSAGE
        end
      end

      def after_feature_element(scenario)
        @io.puts " #{scenario.name} (#{@duration}s)"
        @duration = 0.0
      end
    end
  end
end
