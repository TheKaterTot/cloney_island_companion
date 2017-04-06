class HomeController < ApplicationController
  def index
    @users = CloneyService.users_by_reputation
    @banned_users = CloneyService.banned_users
    @recent_questions = CloneyService.recent_questions
  end
end
