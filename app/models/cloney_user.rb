class CloneyUser
  attr_reader :data, :name, :reputation

  def initialize(data)
    @data = data
  end

  def name
    data["name"]
  end

  def reputation
    data["reputation"]
  end

  def email
    data["email"]
  end
end
