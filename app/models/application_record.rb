# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def fill_stars
    rating.to_i
  end

  def blank_stars
    5 - rating.to_i
  end
end
