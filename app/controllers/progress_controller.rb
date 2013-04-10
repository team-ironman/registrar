class ProgressController < ApplicationController

  def index
    @semester = Semester.first
    @days_before_semester = (@semester.start.to_date - Time.now.to_date).to_i
  end

end