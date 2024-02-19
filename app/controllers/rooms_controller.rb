class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @room = Room.new
    @rooms = Room.public_rooms

    @users = User.all_except(current_user)

    render 'index'

  end


  def show
   #s current_user.update_without_password(room_id: @single_room.id)
    @single_room = Room.find(params[:id])

    @rooms = Room.public_rooms
    @room = Room.new

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    @users = User.all_except(current_user)

    render 'index'
  end

  def create
    @room = Room.create(name: params['room']['name'])
  end

  
end