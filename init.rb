$pidfile = File.join(Rails.root, 'tmp', 'pids', "rails-#{$$}.pid")
File.open($pidfile, 'w') {|f| f.write($$)}
END { FileUtils.rm $pidfile }
Signal.trap('ALRM') { I18n.reload! }
