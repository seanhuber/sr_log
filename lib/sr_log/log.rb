module SrLog
  class Log
    include Singleton

    class SrLogger < Logger
      def format_message severity, timestamp, progname, msg
        "\n#{msg}\n"
      end
    end

    def log log_key, msg, opts = {}
      @logfiles ||= {}
      log_month = Date.current.strftime '%Y.%m'

      unless @logfiles.has_key?(log_key) && @logfiles[log_key][:log_month] == log_month
        filename = "#{log_month}_#{log_key.to_s}.log"

        if opts.has_key?(:dir)
          log_path = File.join opts[:dir], filename
          FileUtils.mkdir_p(opts[:dir]) unless File.directory?(opts[:dir])
        else
          log_path = Rails.root.join 'log', filename # TODO: remove undocumented dependency of Rails
        end

        @logfiles[log_key] = {log: SrLogger.new(log_path), log_month: log_month}
      end

      msg = "Logged by user: #{opts[:current_user]}\n#{msg}" if opts.has_key?(:current_user)

      @logfiles[log_key][:log].info msg
    end
  end
end
