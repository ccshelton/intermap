class Admin::PagesController < ApplicationController
  layout 'admin_layout'
  before_action :authorize

  def settings
    @app = current_tenant
  end

  private
    def authorize
      @app = current_tenant
      unless current_user && current_user.id == @app.admin_id
        redirect_to root_path
      end
    end
end
