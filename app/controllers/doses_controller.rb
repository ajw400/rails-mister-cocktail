class DosesController < ApplicationController
  before_action :set_cocktail, only: [:show, :new, :create]

  def index
  end

  def show
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.ingredient = Ingredient.find(params["dose"]["ingredient"])
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.save!
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end


end
