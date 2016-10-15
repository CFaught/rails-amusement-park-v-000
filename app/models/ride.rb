class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    # Check if user can ride attraction
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    end

    # Update user
    ticket_count = user.tickets - attraction.tickets
    nausea = user.nausea + attraction.nausea_rating
    happiness = user.happiness + attraction.happiness_rating

    user.update(tickets: ticket_count, nausea: nausea, happiness: happiness)
    "Thanks for riding the #{attraction.name}!"
  end
end
