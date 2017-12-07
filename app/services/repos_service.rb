class ReposService

  def initialize(user)
    @user = user
  end

  def starred
    raw_repos.map do |repo|
      Repo.new(repo)
    end
  end

  private
  
  def raw_repos
    github_service.get_raw_starred_repos
  end

  def github_service
    GithubService.new(@user)
  end
end