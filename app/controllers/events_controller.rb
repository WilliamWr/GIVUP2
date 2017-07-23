class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
#     if params[:term].present?
# @events = Eventbrite::Event.search({q: params[:term]}).events
# else
# @events = Eventbrite::Event.search({q: 'Miami'}).events
# end
    # @event = Eventbrite::Event.search({q: 'Community Service'})
    # @events = Eventbrite::Event.search({q: params[:term]}).events
    # @events = Event.all
 #    @events = if params[:term]
 #   Event.where('name LIKE ?', "%#{params[:term]}%")
 # else
 #   Event.all
 # end


    # @events = if params[:term]
 # Event.where('name LIKE ?', "%#{params[:term]}%")




  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  def join
    user_event = UserEvent.new
    user_event.user_id = params[:user_id]
    user_event.event_id = params[:event_id]
    user_event.save
    redirect_to '/create'
  end

  def verified_hours
    user = User.find_by(id: params[:user_id])
    event = Event.find_by(id: params[:event_id])
    user_event = UserEvent.where(user_id: user.id, event_id: event.id).first

    hours = event.end - event.start
    # hours = Time.at(hours).strftime("%H:%M:%S").split(":")[0]
    user_event.hours = hours.to_i
    user_event.save

    user.is_verified = true
    user.hours = user.hours.to_i + hours.to_i
    user.save
    redirect_to "/user/#{user.username}"
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def event_params
 params.require(:event).permit(:name, :term)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start, :end, :address)
    end
end
