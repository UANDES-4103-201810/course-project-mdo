class DefaultController < ApplicationController
  def home
    @projects = Project.all.limit(3)
  end
end
