class Text < ApplicationRecord
  with_options presence: true do
    validates :genre
    validates :title
    validates :content
  end

  has_many :read_progresses, dependent: :destroy

  enum genre: {
    invisible: 0,
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5,
  }

  RAILS_GENRE_LIST = %w[basic git ruby rails].freeze
  PHP_GENRE_LIST = %w[php].freeze

  def read_progress_by?(user)
    read_progresses.exists?(user_id: user.id)
  end
end
