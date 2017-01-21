class AppsController < ApplicationController
  layout :resolve_layout

  def index
  end

  def new
    @app = App.new
  end

  def create
    @app = current_admin.apps.new(app_params)
    if @app.save
      redirect_to root_url(subdomain: @app.subdomain)
    else
      render 'new'
    end
  end

  def update
    @app = current_tenant
    if @app.update(app_params)
      redirect_to "/admin/settings"
    else
      render "/admin/pages/settings"
    end
  end

  private
    def app_params
      params.require(:app).permit(:intercom_id, :subdomain)
    end

    def resolve_layout
      if action_name == 'index'
        'apps_layout'
      else
        'admin_layout'
      end
    end
end
