class ConversationsController < ApplicationController
    before_action :set_conversation, only: %i[ show]

    before_action :authenticate_user! 
    
    def new
        @conversation = Conversation.new
    end
    
    def create
        #check if conversation exists before creating

        @conversation = Conversation.new(conversation_params)
    
        respond_to do |format|
          if @conversation.save
            format.html { redirect_to conversation_url(@conversation), notice: "conversation was successfully created." }
            format.json { render :show, status: :created, location: @conversation }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @conversation.errors, status: :unprocessable_entity }
          end
        end
      end
    
      def show  
      end

      def index
        @users = User.all
        @conversations = Conversation.all
      end  

    private

    def set_conversation
        @conversation = Conversation.find(params[:id])
    end

    def conversation_params
        params.require(:conversation).permit(:sender_id, :recipient_id)
    end

  end