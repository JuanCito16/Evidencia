class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]
  def index
    @people = Person.all
  end

   def new
    @person = Person.new
  end
  
  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end
  

  def create
    @person = Person.new(person_params)
    if @person.save
      flash[:notice] = "Registro guardado"
      redirect_to person_path(@person)
    else
      flash[:alert] = "Ha ocurrido un problema"
      render :new
    end
  end
  def update
    @person = Person.find(params[:id])
      if @person.update(person_params)
        redirect_to person_path (@person)
      else
        render :edit
      end
  end
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Se ha borradp el registro de manera satisfactoria" }
      format.json { head :no_content }
    end
  end

  private
  def set_person
      @person = Person.find(params[:id])
    end

  def person_params
    params.require(:person).permit(:identification, :first_name, :second_name, :first_last_name, :second_last_name, :role_id, :document_id)
  end
end
