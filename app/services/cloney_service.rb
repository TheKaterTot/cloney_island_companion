require 'net/http'
require 'uri'

class CloneyService

  def self.users_by_reputation
    request = Faraday.get('https://calm-crag-26774.herokuapp.com/api/v1/users/by_reputation')
    JSON.parse(request.body).map do |data|
      CloneyUser.new(data)
    end
  end

  def self.banned_users
    request = Faraday.get('https://calm-crag-26774.herokuapp.com/api/v1/users/banned')
    JSON.parse(request.body).map do |data|
      CloneyUser.new(data)
    end
  end

  def self.recent_questions
    request = Faraday.get("https://calm-crag-26774.herokuapp.com/api/v1/questions/recent_questions")
    JSON.parse(request.body).map do |data|
      CloneyQuestion.new(data)
    end
  end

  def create_question(params)
  uri = URI.parse("https://calm-crag-26774.herokuapp.com/api/v1/questions")
  request = Net::HTTP::Post.new(uri)
  request["Authorization"] = "Token token=a5377a83ba732cf562a5ef61ba8863bc"
  request.set_form_data(
  "user_id" => params[:user_id],
  "body" => params[:body],
  "category_id" => params[:category_id],
  "title" => params[:title],
  )

  req_options = {
    use_ssl: uri.scheme == "https",
  }

  response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end
end
end
