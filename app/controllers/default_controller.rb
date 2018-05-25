class DefaultController < ApplicationController
  def home
    @projects = Project.where(:outstanding => true).limit(3)
  end
end
