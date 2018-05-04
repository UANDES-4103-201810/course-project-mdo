require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { ammount: @project.ammount, approved: @project.approved, days_to_go: @project.days_to_go, deleted: @project.deleted, delivery_date: @project.delivery_date, description: @project.description, descriptive_page: @project.descriptive_page, outstanding: @project.outstanding, picture: @project.picture, title: @project.title, video: @project.video } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { ammount: @project.ammount, approved: @project.approved, days_to_go: @project.days_to_go, deleted: @project.deleted, delivery_date: @project.delivery_date, description: @project.description, descriptive_page: @project.descriptive_page, outstanding: @project.outstanding, picture: @project.picture, title: @project.title, video: @project.video } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
