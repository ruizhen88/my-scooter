class MessagesController < ApplicationController
  # after_action :skip_pundit?
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    # raise
    # if @messages.length > 10
    #   @over_ten = true
    #   @messages = @messages[-10..-1]
    # end
    # if params[:m]
    #   @over_ten = false
    #   @messages = @conversation.messages
    # end
    # if @messages.last
    #   @messages.last.read = true if @messages.last.user_id != current_user.id
    # end
    @message = @conversation.messages.new
    authorize @messages
  end

  def new
    @message = @conversation.messages.new
    authorize @message
  end

  def create
    @message = @conversation.messages.new(message_params)
    redirect_to conversation_messages_path(@conversation) if @message.save
    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
