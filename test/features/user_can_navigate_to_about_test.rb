require './test/test_helper'

class LinkTest < CapybaraTestCase
  def test_user_can_see_the_homepage
    visit '/'
    click_on "About"

    assert_equal 200, page.status_code
    assert_equal '/about', current_path
    assert page.has_content?("About Me!")
  end

  def test_cannot_visit_nonexistent_page
  visit '/kittens'

  assert page.has_content?("Page not found.")
  assert_equal 404, page.status_code
  end
end
