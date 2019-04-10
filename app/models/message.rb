class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  validates :content, presence: true

  def as_json(*)
    {
      id: id,
      author: user.username,
      content: content,
      created_at: created_at,
      channel: channel.name
    }
  end
end
