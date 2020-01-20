# frozen_string_literal: true

class PropertiesController < ApplicationController
  skip_before_action :authorize_request
  before_action :set_category
  before_action :set_category_property, only: %i[show update destroy]

  # GET /categories/:category_id/properties
  def index
    json_response(@category.properties)
  end

  # GET /categories/:category_id/properties/:id
  def show
    json_response(@property)
  end

  # POST /categories/:category_id/properties
  def create
    @category.properties.create!(property_params)
    json_response(@category, :created)
  end

  # PUT /categories/:category_id/properties/:id
  def update
    @property.update(property_params)
    head :no_content
  end

  # DELETE /categories/:category_id/properties/:id
  def destroy
    @property.destroy
    head :no_content
  end

  private

  def property_params
    params.permit(:name, :address, :description, :price, :latt, :long)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_category_property
    @property = @category.properties.find_by!(id: params[:id]) if @category
  end
end
