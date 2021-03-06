desc 'Reload the locales on the current instaces of this rails project'
task 'locales:reload' do
  Dir[File.join(Rails.root, 'tmp', 'pids', 'rails-*.pid')].each do |pid|
    pid_n = File.basename(pid).match(/([0-9]+)/)[1]
    print "Reloading #{pid_n}\t\t"
    puts begin
      Process.kill('ALRM', pid_n.to_i)
      'OK'
    rescue
      FileUtils.rm pid
      'FAIL! Pid file removed!'
    end
  end
end
