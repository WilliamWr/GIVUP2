class EventsController < ApplicationController

def index
  # event_brites_events = Eventbrite::Event.search({q: params[:term]})
  @events = Eventbrite::Event.search({q: params[:term]}).events
  # @all_events = @event.events
  # # while events.next?
  # #   events = Eventbrite::Event.search({q: 'Community Service', page: events.next_page})
  # #   all_events.concat(events.events)
  # @events = if params[:term]
  #   Event.where('name LIKE ?', "%#{params[:term]}%")
  # else
  #   Event.all
  # end
  # @events = event_brites_events + my_events
end


def new
  @event = Events.new
end

def event_params
  params.require(:event).permit(:name, :term)
end

def eventsearch


end

end
