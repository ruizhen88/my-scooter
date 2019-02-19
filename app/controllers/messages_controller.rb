class MessagesController < ApplicationController
  # after_action :skip_pundit?
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
    authorize @messages
  end

  def new
    @message = @conversation.messages.new
    authorize @message
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.save
    # if @message.save
    #   respond_to do |format|
    #     format.js
    #   end
    # else
    #   respond_to do |format|
    #     format.js
    #   end
    # end
    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
