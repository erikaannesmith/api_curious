class Follow
  attr_reader :name, :avatar_url

  def initialize(follow)
    @name = follow[:login]
    @avatar_url = follow[:avatar_url]
  end

end