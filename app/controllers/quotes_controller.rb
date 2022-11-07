# frozen_string_literal: true
  
class QuotesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  protect_from_forgery 
  def create
    Quote.create!(
      building_type: params[:building_type],
      service_quality: params[:service_quality],
      number_of_apartments: params[:number_of_apartments],
      number_of_floors: params[:number_of_floors],
      number_of_businesses: params[:number_of_businesses],
      number_of_basements: params[:number_of_basements],
      number_of_parking: params[:number_of_parking],
      number_of_cages: params[:number_of_cages],
      number_of_occupants: params[:number_of_occupants],
      number_of_hours: params[:number_of_hours],
      number_of_elevators_needed: params[:number_of_elevators_needed],
      price_per_unit: params[:price_per_unit],
      elevator_price: params[:elevator_price],
      installation_fee: params[:installation_fee],
      final_price: params[:final_price]
    )
    redirect_to('/quotes')
   
  end
end