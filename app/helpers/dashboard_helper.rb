module DashboardHelper
  def current_clone?(group)
    current_user.groups.include?(group) || current_user.cloned_groups.include?(group)
  end
end
