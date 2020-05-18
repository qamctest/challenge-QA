class DrixitHome < SitePrism::Page

  def initialize
    self.class.set_url "https://drixit.com/home"
  end

  set_url_matcher /home/

  element :home_heading, ".heading_text h1"
  element :slogan_heading, "h2.slogan"
  element :intro_div, "div.intro"

  def validate_page
    self.displayed?.should == true
    wait_until_home_heading_visible
    wait_until_slogan_heading_visible
    wait_until_search_visible
    return {
      :title => home_heading.text.downcase,
      :slogan => slogan_heading.text.downcase,
      :intro => intro_div.text.downcase
    }
  end
end