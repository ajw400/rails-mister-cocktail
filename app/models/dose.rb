class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates_uniqueness_of :ingredient_id, :scope => [:cocktail_id]

  def index
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.ingredient = Ingredient.find_by_name(params[:ingredient])
    @dose.save
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end

end
