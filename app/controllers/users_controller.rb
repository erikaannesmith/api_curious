class UsersController < ApplicationController

  def show
    @member = Member.new(current_user)
  end

end