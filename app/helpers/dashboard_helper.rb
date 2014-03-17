module DashboardHelper
  def current_clone?(group)
    current_user.groups.include?(group) || current_user.cloned_groups.include?(group)
  end

  def clone_button(group)
    (icon_for(current_clone?(group) ? 'eye-close' : 'eye-open') + " " + group.cloned_users.count.to_s).html_safe
  end

  def clone_link(group)
    current_clone?(group) ? unclone_group_path(group) : clone_group_path(group)
  end

  def clone_class(group)
    "btn #{current_clone?(group) ? 'active' : ''}"
  end

  def link_styles(link)
    "color: #{link.color.hex_value}; border: 0.3em solid #{link.border_color.hex_value}; background-color: #{link.background_color.hex_value}"
  end

  def show_group_as_link?(group, user)
    edit_mode? && current_user == group.user && (controller_name != 'users' && action_name != 'show' || current_user == user)
  end
end
