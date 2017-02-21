class Post
  include Mongoid::Document
  include Mongoid::FullTextSearch

  has_many :comments
  field :title, type: String
  field :content, type: String
  field :body, type: String
  field :views, type: Integer
  field :like, type: Integer

  fulltext_search_in :title, :content

  def self.search params
    if params[:search].present?
      records = Post.any_of({:title => params[:search]}, {:body => params[:search]})
    else
      records = Post.limit(100)
    end
    records
  end
end
