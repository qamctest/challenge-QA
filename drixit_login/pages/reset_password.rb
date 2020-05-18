class DrixitResetPassword < SitePrism::Page

  def initialize
    self.class.set_url "https://drixit.com/ResetPassword"
  end

  set_url_matcher /ResetPassword/

  element :title_heading, "h3.title_section-2"
  elements :description_paragraphs, ".bPad24px p"
  elements :success_reset_password_paragraphs, ".bPad24px p"
  element :user_name_input, "#tpt_resetPasswordEmail"
  element :reset_password_button, "button[type='submit']"
  element :login_button, ".button-bar a[href*='Login']"

  def reset_user_password(user)
    user_name_input.set(user[:email])
    reset_password_button.click
  end

  def validate_page
    self.displayed?.should == true
    wait_until_user_name_input_visible
    wait_until_reset_password_button_visible
    wait_until_title_heading_visible
    return {
      :title => title_heading.text.downcase,
      :subtitle => get_description_paragraphs
    }
  end

  def get_description_paragraphs
    wait_until_description_paragraphs_visible
    return description_paragraphs.map { |a| a.text }.join(" ").downcase
  end

  def get_reset_password_message
    wait_until_login_button_visible
    return success_reset_password_paragraphs.map { |a| a.text }.join(" ").downcase
  end
end