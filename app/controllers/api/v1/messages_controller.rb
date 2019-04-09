class Api::V1::MessagesController < ActionController::API
  before_action :set_channel
  def index
    @messages = Message.where(channel: @channel)
    messages_display = @messages.map do |message|
      { id: message.id, author: message.user.username, content: message.content, created_at: message.created_at }
    end
    render json: messages_display
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    binding.pry
    @message.save!
  end

  private

  def message_params
    params.require(:message).permit(:content, :channel)
  end

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end
