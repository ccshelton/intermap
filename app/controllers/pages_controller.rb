class PagesController < ApplicationController
  def home
    if current_admin
      redirect_to '/apps/new'
    end
  end
end
