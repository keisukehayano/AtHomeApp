class User < ApplicationRecord
    has_one_attached :user_image
    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true
                      has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    validates :user_image,   content_type: { in: %w[image/jpeg image/gif image/png],
        message: "must be a valid image format" },
        size:         { less_than: 5.megabytes,
        message: "should be less than 5MB" }


    # 表示用のりサイズ済み画像を返す
    def display_image
        user_image.variant(resize_to_limit: [125, 125])
    end
end
