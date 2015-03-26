class InvalidBaseError < StandardError
  attr_reader :message

  def message
    "You entered a base which does not include one of the valid bases: A, C, T, or G. Choose one of these bases as your argument. For example, `#compliment_by_base('A')`"
  end
end