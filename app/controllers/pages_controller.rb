class PagesController < ApplicationController
  def home
    if current_admin && current_admin.apps.none?
      redirect_to '/apps/new'
    elsif current_admin && current_admin.apps.any?
      redirect_to '/apps'
    else
      redirect_to '/admins/sign_in'
    end
  end
end
