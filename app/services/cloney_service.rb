require 'net/http'
require 'uri'

class CloneyService

  def self.users_by_reputation
    request = Faraday.get('https://pure-wildwood-52964.herokuapp.com/api/v1/users/by_reputation')
    JSON.parse(request.body).map do |data|
      CloneyUser.new(data)
    end
  end

  def self.banned_users
    request = Faraday.get('https://pure-wildwood-52964.herokuapp.com/api/v1/users/banned')
    JSON.parse(request.body).map do |data|
      CloneyUser.new(data)
    end
  end

  def create_question(params)
  uri = URI.parse("http://localhost:3000/api/v1/questions")
  request = Net::HTTP::Post.new(uri)
  request["Authorization"] = "Token token=d4700f94ae4457e048a4557edd752a84"
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
