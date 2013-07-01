class ColorsController < ApplicationController
  def new
    @color = Color.new
  end

  def edit
    @color = Color.find(params[:id])
  end

  def index
    @colors = Color.order('hex_value')
  end

  def destroy
    @color = Color.find(params[:id])
    @color.destroy
  end
end
