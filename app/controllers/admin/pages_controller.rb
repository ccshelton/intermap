class Admin::PagesController < ApplicationController
  layout 'admin_layout'
  before_action :authorize
  include ApplicationHelper

  def settings
    @app = current_tenant
  end

  def javascript
    @app = current_tenant
    @intercom_settings = []
     if params[:intercom_settings].present?
      permit_params(params)
      @intercom_settings = parse_settings(params[:intercom_settings])
    end
  end

  def render_settings
    permit_params(params)
    @cda_count = params[:value].to_i
    render :partial => 'cda_form'
  end

  def intercom_settings
    permit_params(params)
    @intercom_settings = parse_settings(params[:intercom_settings])
    validate_settings(@intercom_settings)
    redirect_to admin_javascript_path(:intercom_settings => @intercom_settings)
  end

  private def authorize
      @app = current_tenant
      unless current_admin && current_admin.id == @app.admin_id
        redirect_to root_path
        flash[:error] = "You do not have permission to access that page"
      end
    end

  private def permit_params(params)
    return params.permit(:value) if params[:value].present?
    params[:intercom_settings].each do |param|
      param.permit(:field, :value, :type)
    end
  end

  private def parse_settings(params_array)
    params_array.map { |settings| {field: settings[:field], value: settings[:value], type: settings[:type] } }
  end

  private def validate_settings(settings_array)
    settings_array.each do |hash|
      valid_attribute = false
       if hash[:type] == "date"
        valid_attribute = valid_timestamp?(hash[:value])
      elsif hash[:type ] == "integer"
        valid_attribute = valid_integer?(hash[:value])
      elsif hash[:type] == "string"
        valid_attribute = valid_string?(hash[:value])
      else
        valid_attribute = valid_float?(hash[:value])
      end
      hash[:valid_attribute?] = valid_attribute
    end
  end

end
