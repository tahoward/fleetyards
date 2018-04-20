# frozen_string_literal: true

class User < ApplicationRecord
  devise :two_factor_authenticatable, :two_factor_backupable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable, :timeoutable,
         otp_secret_encryption_key: Rails.application.secrets[:devise_otp],
         otp_backup_code_length: 32, otp_number_of_backup_codes: 10,
         authentication_keys: [:login]

  has_many :vehicles,
           dependent: :destroy
  has_many :models,
           through: :vehicles
  has_many :manufacturers,
           through: :models
  has_many :public_vehicles,
           -> { where(purchased: true, public: true) },
           class_name: 'Vehicle',
           inverse_of: false
  has_many :public_models,
           class_name: 'Model',
           through: :public_vehicles,
           source: :model,
           inverse_of: false

  validates :username,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[a-zA-Z0-9\-_]+\Z/ }

  attr_accessor :login

  before_validation :clean_username

  mount_uploader :avatar, AvatarUploader

  before_create :setup_otp_secret

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    if login.present?
      where(conditions.to_h)
        .find_by(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }])
    elsif conditions.key?(:username) || conditions.key?(:email)
      find_by(conditions.to_h)
    end
  end

  def setup_otp_secret
    self.otp_secret = User.generate_otp_secret
  end

  def clean_username
    return if username.blank?

    self.username = username.strip
  end
end
