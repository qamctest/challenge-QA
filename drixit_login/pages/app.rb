class DrixitApp

  def data
    DrixitData.new
  end

  def home
    DrixitHome.new
  end

  def login
    DrixitLogin.new
  end

  def reset_password
    DrixitResetPassword.new
  end

  def profile
    DrixitProfile.new
  end
end