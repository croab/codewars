def queue_time(customers, n)
  number_of_customers = customers.size
  time = 0
  while number_of_customers > 0
    n > number_of_customers ? n = number_of_customers : n
    # Pick first two customers (because will delete each time a customer has queued long enough)
    first_customers = customers[0...n]
    first_customers.each_with_index do |customer, index|
      # Pass time for customer
      customers[index] = customer - 1
      # Check if the customer has finished queuing and if so delete
      if customers[index] == 0
        number_of_customers -= 1
        # customers.delete_at(index)
      end
    end
    customers.reject! { |customer| customer == 0 }
    p customers
    # Passage of time
    time += 1
  end
  puts "The queue took #{time} minutes"
  return time
end

# def handle_customers(customer, index)

# end

queue_time([2,2,3,3,4,4], 2)
