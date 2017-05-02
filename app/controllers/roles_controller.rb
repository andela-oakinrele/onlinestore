class RolesController < ApplicationController

  def index
    # binding.pry
    @roles = Role.all
  end

  def create
   @role =  Role.create(role_params)
    flash[:notice] = "Role successfully created"
    redirect_to roles_path
  end

  def destroy
    role = Role.find(params[:id])
    unless role.title == "Admin" || role.title == "User" || role.title == "Vendor"
      role.destroy
      redirect_to roles_path
    else
      flash[:notice] = "Cannot delete default role"
      redirect_to roles_path
    end
  end

  def update

    role = Role.find(params[:id])
    role.title = role_params[:title]
    role.save
    redirect_to roles_path
  end

  def role_params
    params.require(:role).permit(:title)
  end
end
