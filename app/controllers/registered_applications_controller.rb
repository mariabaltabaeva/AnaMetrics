class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = current_user.registered_applications.new(registered_application_params)
    @registered_application

    if @registered_application.save
      flash[:notice] = "App was saved."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error saving the app.Try again."
      render :new
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.assign_attributes(registered_application_params)

    if @registered_application.save
      flash[:notice] = "App was updated."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error updating the app.Try again."
      render :new
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
       redirect_to registered_applications_path
     else
       flash.now[:alert] = "There was an error deleting the app."
       render :show
     end
   end

   private
   def registered_application_params
     params.require(:registered_application).permit(:name, :url)
   end
 end
