class Configuration

  @settings = {
    email_on_create_user: true,
    current_semester: 1
  }  

  def settings
    @global_settings
  end

end