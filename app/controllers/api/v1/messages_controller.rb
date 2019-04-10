class Api::V1::MessagesController < ActionController::API
  before_action :set_channel
  def index
    @messages = Message.where(channel: @channel)
    # same as @messages = @channel.messages.order('created_at ASC')
    # below lines replaced by Message.as_json method in model to display proper fields
    # messages_display = @messages.map do |message|
    #   { id: message.id, author: message.user.username, content: message.content, created_at: message.created_at }
    # end
    render json: @messages
  end

  def create
    @message = Message.new(message_params)
    # same as @message = @channel.messages.build(message_params)
    @message.user = current_user
    @message.channel = @channel
    @message.save!
    render json: @message # see Message.as_json method in model to display proper fields
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end
