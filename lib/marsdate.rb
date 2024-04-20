# frozen_string_literal: true

require_relative "marsdate/version"

module Marsdate
  class Error < StandardError; end
  
  class MarsDateConverter
  # Constants for calculations
  EARTH_SECS_PER_DAY = 86400
  MARTIAN_SECS_PER_SOL = 88775.244  # Martian day in seconds

  # Convert Earth date in "DD/MM/YYYY" format to Martian sol
  def self.earth_to_mars(date_str)
    earth_date = Date.strptime(date_str, '%d/%m/%Y')
    ref_date = Date.new(2000, 1, 1) # Reference Earth date when Mars and Earth were aligned

    # Calculate the number of Earth days since the reference date
    days_since_ref = (earth_date - ref_date).to_i

    # Convert Earth days to Martian sols
    sols = (days_since_ref * EARTH_SECS_PER_DAY) / MARTIAN_SECS_PER_SOL

    sols.floor  # Return the integer part of the Martian sols
  end
end

