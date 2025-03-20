class WeatherController < ApplicationController
  def index;end

  def show;end

  def search
    address = sanitize_address(params[:address])
    input_zipcode = extract_zipcode(address)
    
    # Cache or fetch the geocode result
    geocode_result = Rails.cache.fetch("geocode:#{address}", expires_in: 30.minutes) do
      LocationIq.new.geocode(address)  # returns [lat, lon, zip]
    end

    lat, lon, api_zipcode = geocode_result
    zipcode = input_zipcode.presence || api_zipcode
    cache_key = "geocode:#{Digest::SHA256.hexdigest(address)}"

    if zipcode.present? && Rails.cache.exist?(cache_key)
      # Cache hit: read from cache and mark as cached.
      result_data = Rails.cache.read(cache_key).merge(cached: true)
    else
      # Cache miss: fetch data and store it with cached: false.
      result_data = Rails.cache.fetch(cache_key, expires_in: 30.minutes) do
        weather = OpenWeatherService.new([lat, lon]).fetch_weather
        forecast = OpenWeatherService.new([lat, lon]).fetch_forecast
        { current_weather: weather, forecast: forecast, cached: false }
      end
    end

    render json: result_data
  end


  private

  def sanitize_address(address)
    return nil unless address.is_a?(String) && address.length <= 255 # Limit size
    address.gsub(/[^a-zA-Z0-9,\s.#&'-]/, '') # Allow common address characters
  end

  def extract_zipcode(address)
    # Match a 5-digit or ZIP+4 code only if it appears at the end of the string
    match = address.match(/\b(\d{5}(?:-\d{4})?)\b\s*$/)
    match ? match[1] : nil
  end

end
