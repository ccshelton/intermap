class Admin::PagesController < ApplicationController
  layout 'admin_layout'
  before_action :authorize

  def settings
    @app = current_tenant
  end

  def javascript
    @app = current_tenant
  end

  private
    def authorize
      @app = current_tenant
      unless current_admin && current_admin.id == @app.admin_id
        redirect_to root_path
        flash[:error] = "You do not have permission to access that page"
      end
    end
end
