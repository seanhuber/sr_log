require 'sr_log/version'
require 'sr_log/log'

module Kernel
  unless defined? sr_log
    def sr_log log_key, msg, **opts
      SrLog::Log.instance.log log_key, msg, opts
    end

    module_function :sr_log
  end
end
