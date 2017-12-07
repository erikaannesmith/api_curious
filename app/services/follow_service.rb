class FollowService

  def initialize(user)
    @user = user
  end

  def following
    raw_following.map do |following|
      Follow.new(following)
    end
  end

  def followers
    raw_followers.map do |follower|
      Follow.new(follower)
    end
  end

  private

  def raw_followers
    github_service.get_followers
  end

  def raw_following
    github_service.get_following
  end

  def github_service
    GithubService.new(@user)
  end



end