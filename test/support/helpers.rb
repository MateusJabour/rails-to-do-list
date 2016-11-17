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
  end
end
