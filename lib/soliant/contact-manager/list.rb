require 'csv'
require 'soliant/contact-manager/contact'

module Soliant
module ContactManager

class List
  attr_reader :contacts
  attr_reader :index
  attr_reader :path

  def initialize(path)
    @contacts = {}
    @index = {}
    @path = path

    @contacts = CSV.read(path, headers: :first_row).map { |row| Contact.new(row.to_hash) }

    index_by(:email)
    index_by(:last_name)
  end

  def find(email)
    @index[:email][email]
  end

  def query(field, letter)
    @index[field.to_sym]
      .select { |k| k.start_with? letter }
      .values
      .sort_by { |c| c.send(field.to_sym) }
  end

  def index_by(field)
    @index[field] = {}
    @contacts.each { |x| @index[field][x.send(field)] = x }
  end

  def length
    @contacts.length
  end
end

end
end
