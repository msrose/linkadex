module ApplicationHelper
  def icon_for(type)
    "<i class='icon-#{type.to_s}'></i>".html_safe
  end

  def escaped_id(active_record_object)
    escape_javascript(active_record_object.id.to_s)
  end
end
