class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shipping_addresses,dependent: :destroy
  has_many :cart_items,dependent: :destroy
  has_many :orders,dependent: :destroy

  enum deleted_status:{ Invalid: 0, Validity: 1}
  	validates :last_name, presence: true
  	validates :first_name, presence: true

  def toggle_deleted_status!
    if Validity?
      Invalid!
    else
      Validity!
    end
  end

  def active_for_authentication?
    super && Validity?
  end

  # def inactive_message
  #   Invalid? super: :withdrawn
  # end

  	validates :last_name_kana, presence: true,
                 format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "は全角カタカナのみで入力して下さい"
                 }
    validates :first_name_kana, presence: true,
                 format: {
                          with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                          message: "は全角カタカナのみで入力して下さい"
                         }

    validates :postal_code, presence: true, numericality: { only_integer: true},
                  format: {
                           with: /\A\d{7}\z/,
                           message: "を正しく入力して下さい"
                          }

  	validates :telephone, presence: true, numericality: { only_integer: true},
                  format: {
                           with:/\A\d{10,11}\z/,
                           message: "を正しく入力してください"
                          }

  	validates :address, presence: true

end
