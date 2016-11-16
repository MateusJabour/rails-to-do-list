module Locale
  private

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale)
  end

  def default_url_options(options = {})
    {locale: I18n.locale}.merge(options)
  end

end
