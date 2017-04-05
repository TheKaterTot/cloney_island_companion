class CloneyService

  def self.users_by_reputation
    request = Faraday.get('https://pure-wildwood-52964.herokuapp.com/api/v1/users/by_reputation')
    JSON.parse(request.body).map do |data|
      CloneyUser.new(data)
    end
  end
end
