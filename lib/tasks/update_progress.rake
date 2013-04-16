
task :update_progress => :environment do
  puts "#{Time.now} updating_progress #{ENV['RAILS_ENV']}"
  update_dots=''
  User.find_each do |user|
    update_dots<<'.'
    user.update_progress
    sleep 1
  end
  puts update_dots
end