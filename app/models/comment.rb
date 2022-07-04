class Comment < ApplicationRecord
    include Visible

    belongs_to :article
    validates :body, presence: true
    validates :commenter, presence: true

end
