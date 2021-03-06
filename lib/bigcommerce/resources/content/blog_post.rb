# Blog Post
# Content entries in the store's blog.
# https://developer.bigcommerce.com/api/stores/v2/blog/posts

module Bigcommerce
  class BlogPost < Resource
    include Bigcommerce::ResourceActions.new uri: 'blog/posts/%d'

    property :id
    property :url
    property :count
    property :preview_url
    property :body
    property :tags
    property :summary
    property :title
    property :content
    property :author
    property :author_url
    property :is_published
    property :published_date
    property :published_at
    property :meta_description
    property :meta_keywords
    property :thumbnail_path

    def self.count
      get 'blog/posts/count'
    end
  end
end
