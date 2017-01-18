class AppsController < ApplicationController
  layout "admin_layout"
  def index
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)
    if @app.save
      redirect_to root_url(subdomain: @app.subdomain)
    else
      render 'new'
    end
  end

  def update
    @app = current_tenant
    if @app.update(app_params)
      redirect_to "/admin"
    else
      render "/admin"
    end
  end

  private
    def app_params
      params.require(:app).permit(:intercom_id, :subdomain)
    end
end
