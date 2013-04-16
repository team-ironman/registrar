
task :update_progress => :environment do
  start = Time.now
  log_string = "#{start} updating_progress #{ENV['RAILS_ENV']}"
  User.find_each do |user|
    log_string<<'.'
    user.update_progress
    sleep 1
  end
  log_string << (Time.now - start).to_s
  puts log_string
end