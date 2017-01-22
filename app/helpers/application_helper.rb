module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then "alert alert-info"
    when 'success' then "alert alert-success"
    when 'error' then "alert alert-danger"
    when 'alert' then "alert alert-warning"
    end
  end

  def intercom_settings
    if current_tenant
      if current_user
        logged_in_js(current_user)
      elsif current_admin
        logged_in_js(current_admin)
      else
        logged_out_js
      end
    end
  end

  def logged_in_js(user)
    javascript_tag("window.intercomSettings = {#{get_custom_settings} app_id: '#{current_tenant.intercom_id}', email: '#{user.email}', created_at: #{user.created_at.to_i}};")
  end

  def logged_out_js
    javascript_tag("window.intercomSettings = {app_id: '#{current_tenant.intercom_id}'};")
  end

  def get_custom_settings
    settings = ""
    settings += get_user_id.to_s
    settings
  end

  def get_user_id
    if user_id_enabled?
      if current_user
        "user_id: 'user_#{current_user.id}',"
      elsif current_admin
        "user_id: 'admin_#{current_admin.id}',"
      end
    end
  end

  def user_id_enabled?
    if current_tenant.user_id_enabled?
      true
    end
  end
end
