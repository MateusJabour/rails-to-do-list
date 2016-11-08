require "test_helper"

class SampleTest < Minitest::Test
  def test_application_name
    assert_equal "Taskv::Applications", Rails.application.class.name
  end
end
