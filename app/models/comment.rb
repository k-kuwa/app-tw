class Comment < ApplicationRecord
    belongs_to :tweet
    belongs_to :user
    mount_uploader :image, CommentUploader
end
