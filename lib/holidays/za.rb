module Holidays
  # This file is generated by the Ruby Holiday gem.
  #
  # Definitions loaded: data/za.yaml, data/common_methods.yaml
  #
  # To use the definitions in the file, load them right after you load the 
  # Holiday gem:
  #
  #   require 'holidays'
  #   require 'path/to/za'
  #
  # More definitions are available at http://code.dunae.ca/holidays.
  module ZA # :nodoc:
    DEFINED_REGIONS = [:za]
    
    HOLIDAYS_BY_MONTH = {
      5 => [{:mday => 1, :name => "Workers' Day", :regions => [:za]}],
      0 => [{:function => lambda { |year| easter(year)-2 }, :name => "Good Friday", :regions => [:za]},
            {:function => lambda { |year| easter(year)+1 }, :name => "Family Day", :regions => [:za]}],
      6 => [{:mday => 16, :name => "Youth Day", :regions => [:za]}],
      1 => [{:mday => 1, :name => "New Year's Day", :regions => [:za]}],
      12 => [{:mday => 16, :name => "Day of Reconciliation", :regions => [:za]},
            {:mday => 25, :name => "Christmas Day", :regions => [:za]},
            {:mday => 26, :name => "Day of Goodwill", :regions => [:za]}],
      8 => [{:mday => 9, :name => "National Women's Day", :regions => [:za]}],
      3 => [{:mday => 21, :name => "Human Rights Day", :regions => [:za]}],
      9 => [{:mday => 24, :name => "Heritage Day", :regions => [:za]}],
      4 => [{:mday => 27, :name => "Freedom Day", :regions => [:za]}]
    }

# Get the date of Easter in a given year.
#
# +year+ must be a valid Gregorian year.
#
# Returns a Date object.
#--
# from http://snippets.dzone.com/posts/show/765
# TODO: check year to ensure Gregorian
def self.easter(year)
  y = year
  a = y % 19
  b = y / 100
  c = y % 100
  d = b / 4
  e = b % 4
  f = (b + 8) / 25
  g = (b - f + 1) / 3
  h = (19 * a + b - d - g + 15) % 30
  i = c / 4
  k = c % 4
  l = (32 + 2 * e + 2 * i - h - k) % 7
  m = (a + 11 * h + 22 * l) / 451
  month = (h + l - 7 * m + 114) / 31
  day = ((h + l - 7 * m + 114) % 31) + 1
  Date.civil(year, month, day)
end



  end
end

Holidays.class_eval do
  existing_regions = []
  if const_defined?(:DEFINED_REGIONS) 
    existing_regions = const_get(:DEFINED_REGIONS)
    remove_const(:DEFINED_REGIONS)
  end
  const_set(:DEFINED_REGIONS, existing_regions | Holidays::ZA::DEFINED_REGIONS)

  existing_defs = {}
  if const_defined?(:HOLIDAYS_BY_MONTH) 
    existing_defs = const_get(:HOLIDAYS_BY_MONTH)
    remove_const(:HOLIDAYS_BY_MONTH)
  end
  #const_set(:HOLIDAYS_BY_MONTH, existing_defs.merge(Holidays::ZA::HOLIDAYS_BY_MONTH))
  const_set(:HOLIDAYS_BY_MONTH, Holidays::ZA::HOLIDAYS_BY_MONTH)

  include Holidays::ZA
end
