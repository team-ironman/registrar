# app/workers/update_progress_worker.rb
class UpdateProgressWorker
  include Sidekiq::Worker

  def perform(user_id=nil)

    if user_id.blank?

      User.find_each do |user|
        Rails.logger.info "user = #{user.email}"
        user.update_progress
        sleep 1
      end
    
    else
        user = User.find(user_id)
        Rails.logger.info "user = #{user.email}"
        user.update_progress
        sleep 1
    end

  end

end