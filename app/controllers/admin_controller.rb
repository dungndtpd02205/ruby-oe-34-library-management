class AdminController < ApplicationController
  include SessionsHelper

  before_action :check_permission

  def check_permission
    return if admin?

    flash[:fails] = t("login.permis")
    redirect_to root_url
  end
end
