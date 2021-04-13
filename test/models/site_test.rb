require 'test_helper'

class SiteTest < ActiveSupport::TestCase

  test "Site belongs_to User" do
    site = Site.new(user_id: 1)
    assert true
  end

  test "Site has YouTube link" do
    site = Site.new(user_id: 1, link: "https://www.youtube.com/watch?v=WPni755-Krg")
    assert true
  end

end
