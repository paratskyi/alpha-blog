class PagesController < ApplicationController
  def home
    redirect_to :articles if logged_in?
  end

  def about; end
end
