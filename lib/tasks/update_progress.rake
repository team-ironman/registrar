
task :update_progress => :environment do
  User.find_each do |user|
    puts "user = #{user.email}"
    user.update_progress
  end
end