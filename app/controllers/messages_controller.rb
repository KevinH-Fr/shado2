class MessagesController < ApplicationController
 # before_action do
 #   @conversation = Conversation.find(params[:conversation_id]) if params[:conversation_id]
 # end
  

  def index
  #  @messages = @conversation.messages
  #  @message = @conversation.messages.new
  end  
  
  def new
    @message = Message.new
  end
    
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to message_url(@message), notice: "message was successfully created." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
    
  private
  
  def message_params
    params.require(:message).permit(:body, :user_id, :conversation_id)
  end

end