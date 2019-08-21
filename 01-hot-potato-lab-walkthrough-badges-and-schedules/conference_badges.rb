# frozen_string_literal: true

# Write your code here.

def badge_maker(name)
  "Hello, my name is #{name}."
end

def batch_badge_creator(attendees)
  attendees.map do |name|
    badge_maker(name)
  end
end

def assign_room(name, number)
  "Hello, #{name}! You'll be assigned to room #{number}!"
end

def assign_rooms(attendees)
  counter = 1
  result = []
  attendees.each do |name|
    result << assign_room(name, counter)
    counter += 1
  end
  result
end

def printer(attendees)
  attendees.each_with_index do |name, index|
    puts badge_maker(name)
    puts assign_room(name, index + 1)
  end
end
