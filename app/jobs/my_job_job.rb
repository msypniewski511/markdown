class MyJobJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts 'Dziala'
  end

  
end
