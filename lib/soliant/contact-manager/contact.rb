module Soliant
module ContactManager

class Contact
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :email
  attr_accessor :phone

  def initialize(options)
    options.each do |k,v|
      instance_variable_set("@#{k}".to_sym, v)
    end
  end

  def to_s
    "Last: #{last_name}, First: #{first_name}, Phone: #{phone}, E-Mail: #{email}"
  end
end

end
end
