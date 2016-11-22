module ApplicationHelper
  ACTION_ALIASES = {
    'create' => :new,
    'update' => :edit
  }.freeze

  def page_title
    t(:title, scope: [controller.controller_name, aliased_action_name])
  end

  def gravatar(email, alt=nil)
    digest = Digest::MD5::hexdigest(email.to_s)
    image_tag "https://gravatar.com/avatar/#{digest}?d=mm&s=35", class: 'avatar', alt: alt
  end

  def aliased_action_name
    ACTION_ALIASES[controller.action_name] || controller.action_name
  end
end
