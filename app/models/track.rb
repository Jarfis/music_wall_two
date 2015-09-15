class Track < ActiveRecord::Base
  belongs_to :user
  has_many :upvotes
  validates :title, :author, presence: true

  def self.get_by_upvotes
    Track.find_by_sql("SELECT t.*, COUNT(u.track_id) FROM tracks AS t LEFT JOIN upvotes AS u ON t.id = u.track_id GROUP BY t.id ORDER BY COUNT(u.track_id) DESC")
  end
end