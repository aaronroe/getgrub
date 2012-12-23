class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :phone_number, :balance
  # attr_accessible :title, :body


  validates_format_of :phone_number, :with => /^\d*$/, :message => "Should contain numbers only."
  validates_length_of :phone_number, :is => 10, :on => :create

  validates_format_of :balance, :with => /^\d*$/, :message => "Should contain numbers only."

  has_many :requests
  has_many :jobs

end
