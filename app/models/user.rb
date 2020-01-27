class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    # ==========パスワードなしでアップデートできる==========
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end
 
  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
 
  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
         
  validates :name, presence: true, length: { maximum: 50 }
  validates :username, presence: true, uniqueness: true
  
  mount_uploader :profile_photo, ProfilePhotoUploader
end
