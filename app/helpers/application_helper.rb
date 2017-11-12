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
        jsify(logged_instring(current_user))
      elsif current_admin
        jsify(logged_in_string(current_admin))
      else
        jsify(logged_out_string)
      end
    end
  end

  def jsify(string)
    javascript_tag(string)
  end

  def logged_out_string
    "window.intercomSettings = {
          app_id: '#{current_tenant.intercom_id}'
        };"
  end

  def logged_in_string(user, intercom_settings=[])
    "window.intercomSettings = { #{get_custom_settings(intercom_settings)}
        app_id: '#{current_tenant.intercom_id}',
        email: '#{user.email}',
        created_at: #{user.created_at.to_i}
      };"
  end

  def get_custom_settings(cdas=[])
    settings = ""
    settings += get_user_id if user_id_enabled?
    unless cdas.empty?
      cdas.each do |attribute|
        attribute[:value] = "'#{attribute[:value]}'" if attribute[:type] == "string"
        settings += "
        #{attribute[:field]}: #{attribute[:value]}"
        settings += "," unless attribute == cdas.last
      end
    end
    settings
  end

  def get_user_id
      "
        user_id: 'user_#{current_user.id}'," if current_user
      "
        user_id: 'admin_#{current_admin.id}'," if current_admin
  end

  def user_id_enabled?
    current_tenant.user_id_enabled?
  end

  def valid_integer?(integer)
    !!Integer(integer)
  end

  def valid_string?(string)
    string.length <= 255
  end

  def valid_timestamp?(timestamp)
    !!Time.at(timestamp) if /\A[+]?\d+\z/ === timestamp && timestamp.length == 10
    false
  end

  def valid_float?(float)
    suppress(ArgumentError) do
      return !!Float(float)
    end
    false
  end
end
