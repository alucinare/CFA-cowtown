class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  # this is for the friendly_id
  # if we have duplicate titles it will add a number to the end by default or we can use slug candidates
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # this is abstracting the above which previously was title and this will change a duplicate to title plus content. not sure where it stops with the content.
  def slug_candidates
   [
     :title,
     [:title, :content],
   ]
 end

end
