class Configuration

  @settings = {
    email_on_create_user: true,
    current_semester: 1
  }  

  def self.settings
    @settings
  end

end