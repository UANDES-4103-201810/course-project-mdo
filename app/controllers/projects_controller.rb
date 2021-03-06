class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /projects
  # GET /projects.json
  def index
    name = ""
    unless params[:name] == nil
      name = params[:name]
    end

    expression = "%" + name + "%"

    @projects = Project.by_category(params[:category]).where("title LIKE ?", expression)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @info = {
        promises: Promise.where(:project_id => params[:id]),
        user_id: nil,
        disabled: "disabled",
        wishlist: user_signed_in? ? current_user.in_wishlist(params[:id]) : "none"

    }

    if user_signed_in?
      @info[:user_id] = current_user.id
      @info[:disabled] = ""
    end

  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create

    @project = Project.new(project_params.merge(:user_id => current_user.id))

    puts project_params

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      #project_params[:user_id] = User.find(project_params[:user_id])
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:outstanding, :approved, :deleted, :title, :description, :ammount, :days_to_go, :picture, :video, :descriptive_page, :delivery_date, :category_id, :user_id)
    end
end
