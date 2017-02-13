require 'singleton'
require 'logger'
require 'date'
require 'fileutils'

module SrLog
  class Log
    include Singleton

    def log log_key, msg, opts = {}
      @logfiles ||= {}
      log_month = Date.today.strftime '%Y.%m'

      unless @logfiles.has_key?(log_key) && @logfiles[log_key][:log_month] == log_month
        filename = "#{log_month}_#{log_key.to_s}.log"

        log_path = if opts.has_key?(:dir)
          FileUtils.mkdir_p(opts[:dir]) unless File.directory?(opts[:dir])
          File.join opts[:dir], filename
        elsif defined?(Rails)
          Rails.root.join 'log', filename
        else
          folder_path = File.expand_path File.join('.', 'log')
          FileUtils.mkdir(folder_path) unless File.directory?(folder_path)
          File.join folder_path, filename
        end

        @logfiles[log_key] = {log: Logger.new(log_path), log_month: log_month}

        @logfiles[log_key][:log].formatter = proc do |severity, timestamp, progname, msg|
          opts[:single_spaced] ? "#{msg}\n" : "\n#{msg}\n"
        end
      end

      msg = "Logged by user: #{opts[:current_user]}\n#{msg}" if opts.has_key?(:current_user)

      @logfiles[log_key][:log].info msg
    end
  end
end
