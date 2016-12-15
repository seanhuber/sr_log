require 'spec_helper'

describe SrLog do
  it 'has a version number' do
    expect(SrLog::VERSION).not_to be nil
  end

  it 'writes to a log file' do
    log_dir = File.expand_path File.join('.', 'spec', 'test_logs')
    FileUtils.rm_rf(log_dir) if File.directory?(log_dir)
    sr_log :test, 'this is a test', dir: log_dir

    log_file = File.join log_dir, "#{Date.today.strftime('%Y.%m')}_test.log"
    expect(File.file?(log_file)).to be true

    expect(File.readlines(log_file).map(&:strip)).to include 'this is a test'
  end
end
