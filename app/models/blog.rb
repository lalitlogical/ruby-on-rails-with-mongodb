class Blog
  include Mongoid::Document
  include Mongoid::FullTextSearch

  field :title, type: String
  field :content, type: String
  field :views, type: Integer
  field :like, type: Integer

  fulltext_search_in :title, :content

  def self.search params
    if params[:search].present?
      # records = Blog.where(title: params[:search])
      records = Blog.any_of({:title => params[:search]}, {:content => params[:search]})
    else
      # records = Blog.page(params[:page])
      records = Blog.limit(100)
    end
    records
  end
end
