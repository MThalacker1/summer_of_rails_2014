class InvalidSelectionError < StandardError 
  def to_s
    "Sorry, you must enter a valid selection."
  end
end
