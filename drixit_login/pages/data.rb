class DrixitData

  def existing_user
    return {
      :first_name => "user",
      :last_name => "test",
      :full_name => "user test",
      :email => "user@test.com",
      :password => "ASDqwe123!",
      :telephone => "202-555-0181",
      :location => {
        :country => "Argentina",
        :state => "Buenos Aires",
        :city => "Palermo",
        :street => "Test Street 1234",
        :zip => "1414"
      }
    }
  end

  def non_existing_user
    return {
      :email => Faker::Internet.email,
      :password => Faker::Internet.password(8, 16, true, true)
    }
  end

  def reset_password_user
    return {
      :email => "reset@password.com",
      :password => "ASDqwe123!"
    }
  end

  def text
    return {
      :en => {
        :home => {
          :title => "Welcome"
        },
        :login => {
          :title => "sign in or register for a new user account",
          :subtitle => "already working at Drixit? use Drixit careers - internal",
          :error => "the username or password may be incorrect, or access might be restricted."
        },
        :reset_password => {
          :title => "having trouble logging in?",
          :subtitle => "enter the email address associated with your account, then click \"next\". we will email you a link to reset your password.",
          :error => "if the email address you entered, reset@password.com, is associated with an account in our records, you will receive an email from us with instructions for resetting your password. if you do not receive this email, please check your junk mail folder."
        },
        :profile => {
          :welcome => "Welcome,"
      }
    }
  end
end