class PagesController < ApplicationController
  def home
    return redirect_to home_path(user_locale) if user_locale && request.path_info == '/'
  end

  private

  def user_locale
    cookies.signed[:locale]
  end
end
