class DrixitProfile < SitePrism::Page

  def initialize
    self.class.set_url "https://drixit.com//Profile"
  end

  set_url_matcher /Profile/

  section :top_nav, DrixitTopNav, ".nav-main_menu-1"
  section :main_nav, DrixitMainNav, ".nav-main_menu-2"
  section :profile_nav, DrixitProfileMainNav, "#user-bar"
  section :profile_jobs, DrixitProfileJobs, ".section_content:first-child"
  section :profile_information, DrixitProfileInformation, ".section_content:nth-child(2)"
  section :profile_attachments, DrixitProfileAttachments, ".section_content:last-child"

  def validate_page
    self.displayed?.should == true
    wait_until_profile_nav_visible
    wait_until_profile_information_visible
    wait_until_profile_attachments_visible
    return {
      :title => profile_nav.title_heading.text.capitalize,
      :contact_info => profile_information.get_profile_information
    }
  end
end