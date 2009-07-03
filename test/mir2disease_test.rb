require 'test_helper'

class Mir2diseaseTest < ActiveSupport::TestCase
  
  test "test_m2d_diseases" do
    assert_equal(M2dDisease.find_rest(1985),M2dDisease.find_by_name("colorectal cancer"))
  end
  
  test "test_m2d_disease_links" do
    assert(Mature.find(:first).m2d_disease_links.size > 0)
  end
  
  
end
