class OrgsService

  def initialize(user)
    @user = user
  end

  def organizations
    raw_organizations.map do |org|
      Organization.new(org)
    end
  end

  def raw_organizations
    github_service.get_organizations
  end

  private

  def github_service
    GithubService.new(@user)
  end

end