class Member

  def initialize(user)
    @user = user
  end

  def name
    personal_info[:name]
  end

  def avatar_url
    personal_info[:avatar_url]
  end

  def id
    personal_info[:id]
  end
  
  def following
    follow_service.following
  end

  def followers
    follow_service.followers
  end

  def starred_repos
    repos_service.starred
  end

  def organizations
    orgs_service.organizations
  end
  
  private

  def orgs_service
    @orgs_service ||= OrgsService.new(@user)
  end

  def follow_service
    @follow_service ||= FollowService.new(@user)
  end

  def repos_service
    @repos_service ||= ReposService.new(@user)
  end

  def personal_info
    @personal_info ||= github_service.get_personal_info
  end

  def github_service
    @github_service ||= GithubService.new(@user)
  end

end