class Admin::PagesController < ApplicationController
  layout 'admin_layout'
  def settings
    @app = current_tenant
  end
end
