require 'test_helper'

class PageTitleTest < ActionView::TestCase
  include ApplicationHelper

  setup do
    I18n.locale = :en
  end

  test 'returns title' do
    I18n.backend.store_translation(:en, {
      account: { show: {title:'Your account' }}
    })

    controller.stub :controller_name, 'account' do #not working
      controller.stub :action_name, 'show' do
        assert_equal page_title, t('account.show.title')
      end
    end
  end

  test "returns alias for create" do
    I18n.backend.store_translation(:en, {
      account: { new: {title: 'Create your account'} }
    })

    controller.stub :controller_name, 'account' do #not working
      controller.stub :action_name, 'create' do
        assert_equal page_title, t('account.new.title')
      end
    end
  end

  test "returns alias for create" do
    I18n.backend.store_translation(:en, {
      account: { new: {title: 'Update your account'} }
    })

    controller.stub :controller_name, 'account' do #not working
      controller.stub :action_name, 'update' do
        assert_equal page_title, t('account.edit.title')
      end
    end
  end

end
