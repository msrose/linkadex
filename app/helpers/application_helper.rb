module ApplicationHelper
  def icon_for(type)
    "<i class='icon-#{type.to_s}'></i>".html_safe
  end
end
