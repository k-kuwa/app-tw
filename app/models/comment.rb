class Comment < ApplicationRecord
    validates :text, presence: true
    belongs_to :tweet
    belongs_to :user
    mount_uploader :image, CommentUploader
end
