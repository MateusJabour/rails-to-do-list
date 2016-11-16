class ChooseLocaleController < ApplicationController
  def choose
    cookies.permanent.signed[:locale] = user_locale
    redirect_to home_path(user_locale)
  end

  def valid_locale?
    I18n.available_locales.map(&:to_s).include?(params[:locale])
  end

  def user_locale
    if valid_locale?
      params[:locale]
    else
      I18n.default_locale
    end
  end
end
