class Invite < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :token, :token_used, :semester_id

  belongs_to :semester


    # module ActiveAdmin
    # class Invite  < ActiveRecord::Base
      after_create :send_email
      
      def send_email
          Policer.welcome(self).deliver
      end

end
