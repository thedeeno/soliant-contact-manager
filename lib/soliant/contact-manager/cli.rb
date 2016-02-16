require 'clamp'
require 'soliant/contact-manager/console'

module Soliant
module ContactManager

class Cli < Clamp::Command
  parameter 'CONTACTS_PATH', 'path to contacts.csv'

  subcommand 'find', 'Prints contact with given email' do
    parameter 'EMAIL', 'Field to query'

    def execute
      puts list.find(email)
    end
  end

  subcommand 'query', 'Prints contacts who\'s given field starts with given letter' do
    parameter 'FIELD', 'Field to query'
    parameter 'LETTER', 'Starting letter'

    def execute
      list.query(field, letter).each { |contact| puts contact }
    end
  end

  subcommand 'start', 'Starts an interactive session for contact querying' do
    def execute
      Soliant::ContactManager::Console.start(list)
    end
  end

  private

  def list
    List.new(contacts_path)
  end

end

end
end
