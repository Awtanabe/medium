class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes
  has_many :relation_ships
  has_many :followings, through: :relation_ships, source: :follow

  def follow(other_user)
    unless self == other_user
      self.relation_ships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    
    relation_ship = self.relation_ships.find_by(follow_id: other_user.id)
    relation_ship.destroy if relation_ship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
