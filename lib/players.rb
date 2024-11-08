# frozen_string_literal: true

# Platers: initialize
class Players
  attr_accessor :first_name, :second_name

  def initialize(first_name, second_name)
    @first_name = first_name
    @second_name = second_name
  end
end
