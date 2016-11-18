require 'test_helper'

class PageTitleTest < ActionView::TestCase
  include ApplicationHelper

  test 'returns title' do
    controller.stub :controller_name, 'pages' do #not working
      controller.stub :action_name, 'home' do
        assert_equal page_title, t('pages.home.title')
      end
    end
  end

end
