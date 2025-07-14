class RolesController < ApplicationController
  def index
    render json: Role.for_select
  end
end 