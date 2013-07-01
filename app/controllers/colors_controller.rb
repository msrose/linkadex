class ColorsController < ApplicationController
  def new
    @color = Color.new
  end

  def create
    @color = Color.new(color_params)
    @color.save
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    @color = Color.find(params[:id])
    @color.assign_attributes(color_params)
    @color.save
  end

  def index
    @colors = Color.order('hex_value')
  end

  def destroy
    @color = Color.find(params[:id])
    @color.destroy
  end

  private

    def color_params
      params.require(:color).permit(:hex_value, :alias)
    end
end
