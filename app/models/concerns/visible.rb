module Visible
    extend ActiveSupport::Concern

    VALID_STATUSES = ['public', 'private', 'archived']

    included do
        validates :status, inclusion: { in: VALID_STATUSES }
    end

    class_methods do 
        def status_count(article_status)
            where(status: article_status).count
        end
    end

    def show_article(article_status)
        status == article_status
    end

end
