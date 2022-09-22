def queue_time(customers, n)
  # Initialize number of customers and time that has passed (the goal of the exercise is to return the time)
  number_of_customers = customers.size
  time = 0
  # Will reduce the number of customers by 1 when their time reaches 0
  while number_of_customers > 0
    # If n checkouts > the number of customers we do not need the additional checkouts
    n > number_of_customers ? n = number_of_customers : n
    # Pick first two customers (because will delete each time a customer has queued long enough)
    first_customers = customers[0...n]
    first_customers.each_with_index do |customer, index|
      # Pass time for customer
      customers[index] = customer - 1
      # Check if the customer has finished queuing and if so delete
      if customers[index] == 0
        number_of_customers -= 1
      end
    end
    customers.reject! { |customer| customer == 0 }
    # Passage of time
    time += 1
  end
  # puts "The queue took #{time} minutes"
  return time
end
