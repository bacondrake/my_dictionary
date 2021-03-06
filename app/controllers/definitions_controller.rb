class DefinitionsController < ApplicationController
  before_action :set_definition, only: [:show, :edit, :update, :destroy]

  def index
    @definitions = Definition.all
  end

  def show
  end

  def new
    @definition = Definition.new
  end

  def edit
  end

  def create
    @definition = Definition.new(definition_params)
    if @definition.save
      redirect_to definitions_path, notice: "New definition created"
    else
      render 'new'
    end

    # format.js
  end

  def update
    if @definition.update_attributes(definition_params)
      redirect_to definitions_path, notice: "Definition has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @definition.destroy    

    respond_to do |format|
      format.html { redirect_to definitions_path, notice: "Definition has been deleted" }
      format.js # Allows the controller to accept the Javascript call in destroy.js.haml
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_definition
      @definition = Definition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def definition_params
      params.require(:definition).permit(:word, :meaning, :sample, :comments)
    end
end