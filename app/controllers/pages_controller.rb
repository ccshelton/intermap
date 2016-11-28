class PagesController < ApplicationController
  def home
    @users = User.all
    @tenant = ActsAsTenant.current_tenant
  end
end
