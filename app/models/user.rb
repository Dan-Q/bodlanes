class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable, # note: actual "registration" disabled by routing; this line makes password changes possible
         :recoverable,
         :rememberable,
         :trackable,
         :timeoutable,
         :validatable
end
