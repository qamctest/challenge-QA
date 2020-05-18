class DrixitLogin < SitePrism::Page

  def initialize
    self.class.set_url "https://drixit.com//Login"
  end

  set_url_matcher /Login/

  element :title_heading, "h2.title_page-1"
  element :subtitle_heading, "h4.subtitle"

  element :existing_email_input, "form[action*=Login] #tpt_loginUsername"
  element :password_input, "form[action*=Login] #tpt_loginPassword"
  element :sign_in_button, "form[action*=Login] button[type='submit']"
  element :new_email_input, "form[id='panel-login'] #checkEmail"
  element :register_button, "form[id='panel-login'] button[type='submit']"
  element :reset_password_link, "a[href*=ResetPassword]"
  element :login_error_paragraph, "form[action*=Login] .errorText"
  element :register_error_paragraph, "form[action*=RegistrationMethods] .errorText"

  def authenticate_user(user)
    existing_email_input.set(user[:email])
    password_input.set(user[:password])
    sign_in_button.click
  end

  def register_user(user)
    new_email_input.set(user[:email])
    register_button.click
  end

  def validate_page
    self.displayed?.should == true
    wait_until_existing_email_input_visible
    wait_until_password_input_visible
    wait_until_sign_in_button_visible
    wait_until_new_email_input_visible
    return {
      :title => title_heading.text.downcase,
      :subtitle => subtitle_heading.text.downcase
    }
  end

end