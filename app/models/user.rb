class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :comments
  has_many :stories
  has_many :stories_waiting, class_name: 'Story', foreign_key: 'owner_id'
  has_many :epics,    foreign_key: 'author_id'
  has_many :projects, foreign_key: 'owner_id'
end
