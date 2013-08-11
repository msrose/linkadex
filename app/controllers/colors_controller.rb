class ColorsController < ApplicationController
  before_filter :require_signed_in_user

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
    @title = 'Colors - Linkage'
    @colors = Color.order('hex_value')
  end

  def destroy
    @color = Color.find(params[:id])
    @color.destroy unless @color.in_use?
  end

  def clean_up
    @destroyed_ids = []
    Color.select { |color| !color.in_use? }.each do |color|
      @destroyed_ids.push(color.id)
      color.destroy
    end
  end

  private

    def color_params
      params.require(:color).permit(:hex_value, :alias)
    end
end
