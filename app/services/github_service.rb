class GithubService
  attr_reader :user
  
  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      # faraday.headers["X-API-KEY"] = ENV["GITHUB_KEY"]
      faraday.headers["Authorization"] = "token #{user.token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_personal_info
    get_json("/user")
  end

  def get_raw_starred_repos
    get_json("/users/#{user.nickname}/starred")
  end

  def get_following
    get_json("/users/#{user.nickname}/following")
  end

  def get_followers
    get_json("/users/#{user.nickname}/followers")
  end

  def get_organizations
    get_json("/users/#{user.nickname}/orgs")
  end

  private

  def get_json(url)
    response = @conn.get(url)    
    JSON.parse(response.body, symbolize_names: true)
  end

end