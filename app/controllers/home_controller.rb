class HomeController < ApplicationController
  def index
    @users = CloneyService.users_by_reputation
    @banned_users = CloneyService.banned_users
  end
end
