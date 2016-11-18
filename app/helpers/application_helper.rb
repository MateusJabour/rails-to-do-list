module ApplicationHelper
  ACTION_ALIASES = {
    'create' => :new,
    'update' => :edit
  }.freeze

  def page_title
    action_name = ACTION_ALIASES[controller.action_name] ||
                  controller.action_name
    t(:title, scope: [controller.controller_name, action_name])
  end
end
