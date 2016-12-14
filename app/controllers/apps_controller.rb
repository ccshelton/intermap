class AppsController < ApplicationController
  layout "apps_layout"
  def index
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
      params.require(:app).permit(:intercom_id)
    end
end
