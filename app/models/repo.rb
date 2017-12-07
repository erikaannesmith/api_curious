class Repo
  attr_reader :name, :owner, :html_url

  def initialize(repo)
    @name = repo[:name]
    @owner = repo[:owner][:login]
    @html_url = repo[:html_url]
  end

end
