class StationsController < ApplicationController
  def index
    Station.all.map do |station|
      station.aqi = station.aqi.to_i
    end
    @stations = Station.all.to_a.sort_by { |station| station.aqi.to_i }.reverse![0...10]
    @chart_data = @stations.map {|station| {station.country.name => station.aqi}}
    @data_keys = []
    @data_values = []
    @chart_data.each do |dat| 
      @data_keys << dat.keys
      @data_values << dat.values[0].to_i
    end

  end

  def zero
    @title = '0'

  end

end
