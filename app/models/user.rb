class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # this seems to be the model that all the other models are connected to... the comments and posts both belong to this model
  has_many :posts
  has_many :comments
end
