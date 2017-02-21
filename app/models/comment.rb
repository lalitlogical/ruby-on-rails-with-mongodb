class Comment
  include Mongoid::Document

  belongs_to :post
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :body, type: String

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
