require 'cucumber/formatter/progress'

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

      def after_step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background, *args)
        super
        if status == :failed
          error_msg = "#{exception.message} (#{exception.class.name})\n#{exception.backtrace.join("\n")}"

          @io.puts <<-EOMESSAGE

#{format_string(step_match.backtrace_line, :comment)}

#{format_string(error_msg, status)}

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
