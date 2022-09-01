# Netguru coding test
#Introduction
# You are working on a flight management system that helps travelers to find flights between desired destinations and staff to add flights and generate flight seats.
#
#   Problem statement
# To complete this task you need to implement following methods:
#
#                                                         SeatsGenerator.create_seats(rows, seats_in_row, first_row_number)
# FlightManager.find_flights_between(origin, destination, direction_sensitive)
# FlightManager.add_new_flight(flight_number, origin, destination)
# SeatsGenerator.create_seats() method
# The method allows you to create a list of seats where each seat is represented in <integer><string> format, ex.: 2A.
#
#   Method accept three arguments:
#
#                         rows which type is integer
# seats_in_row which type is integer
# first_row_number which type integer
# and returns array as a result, ex.:
#
#   > @seats_generator.create_seats(2, 4, 1)
#
# ['1A', '1B', '1C', '1D', '2A', '2B', '2C', '2D']
# FlightManager.find_flights_between() method
# The method allows you to find flights for provided destinations.
#
#   The method accepts three arguments:
#
#                              origin which type is string
# destination which type is string
# direction_sensitive which type is boolean
# and returns:
#
#   empty array when no flights were found
# array with hash elements when flights were found
# hash element needs to contain flight_number, origin and destination keys with string values, ex.:
#
#   [
#     { flight_number: 'LH1232', origin: 'JFK', destination: 'PAR' }
#   ]
# When you pass the direction_sensitive argument with a boolean value equal to false, the result should include flights from and to destination and to and from destination, ex.:
#
#   > @flight_manager.find_flights_between("JFK", "PAR", false)
#
# [
#   { flight_number: 'LH1232', origin: 'JFK', destination: 'PAR' },
#   { flight_number: 'YH1732', origin: 'PAR', destination: 'JFK' }
# ]
# otherwise result should include only from and to destination, ex.:
#
#   > @flight_manager.find_flights_between("JFK", "PAR", true)
#
# [
#   { flight_number: 'LH1232', origin: 'JFK', destination: 'PAR' }
# ]
# FlightManager.add_new_flight() method
# The method allows you to add a new flight to flight storage. Flight storage can be implemented as a simple array that does not accept duplicate flights.
#
#   The method accepts three arguments:
#
#                              flight_number which type is string
# origin which type is string
# destination which type is string
# and returns a boolean value:
#
#                         true when a flight was added to flights storage
# false when flight could not be added to flights storage
# Example:
#
#   > @flight_manager.add_new_flight('LH1232', 'JFK', 'PAR') == true
#
# true
#
# > @flight_manager.add_new_flight('LH1232', 'JFK', 'PAR') == true
#
# false
# Validation
# Run bundle exec rake test to verify your implementation.
#
#
#
# =============================================================

  # frozen_string_literal: true

  # rubocop:disable Style/Documentation
  class SeatsGenerator
    def create_seats(rows, seats_in_row, first_row_number)
      output = []
      seats = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".chars

      (first_row_number ..rows).each do |row|
        (0..seats_in_row - 1).each do |seat|
          output << row.to_s + seats[seat]
        end
      end

      output
    end
  end
# rubocop:enable Style/Documentation

#===========================================================

  # frozen_string_literal: true

  # rubocop:disable Style/Documentation
  class FlightManager

    def initialize
      @flight_array = []
    end

    def add_new_flight(flight_number, origin, destination)
      flight_hash = {}
      flight_hash.merge!(
        flight_number: flight_number,
        origin: origin,
        destination: destination
      )
      @flight_array << flight_hash

      true
    end

    def find_flights_between(origin, destination, direction_sensitive)
      output = []

      if direction_sensitive
        output << @flight_array.select { |flight| flight[:origin] == origin && flight[:destination] == destination  }
      else
        @flight_array.each do |flight|
          output << flight if (flight[:origin] == origin && flight[:destination] == destination) || (flight[:origin] == destination && flight[:destination] == origin)
        end
      end

      output
    end
  end
  # rubocop:enable Style/Documentation
