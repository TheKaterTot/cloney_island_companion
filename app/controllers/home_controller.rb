class HomeController < ApplicationController
  def index
    @users = CloneyService.users_by_reputation
  end
end
