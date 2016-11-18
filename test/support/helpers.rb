module ActionDispatch
  class IntegrationTest
    def label(scope)
      t(scope, scope: 'form.labels')
    end

    def button(scope)
      t(scope, scope: 'form.buttons')
    end

    def submit(scope)
      t(scope, scope: 'helpers.submit')
    end

    def login_as(user)
      visit home_path(I18n.locale)
      click_on t('menu.login')

      fill_in t('form.labels.user.email'), with: user.email
      fill_in t('form.labels.user.password'), with: 'test'
      click_on t('form.buttons.login')
    end
  end
end
