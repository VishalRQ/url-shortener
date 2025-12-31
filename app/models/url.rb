class Url < ApplicationRecord
  validates :original_url, presence: true, format: URI.regexp(%w[http https])
  validates :short_code, uniqueness: true

  before_validation :generate_short_code, on: :create
  has_many :click_records, class_name: "Click", dependent: :destroy

  def short_url
    # "#{ENV['APP_HOST']}/s/#{short_code}"
    Rails.application.routes.url_helpers.short_url(short_code: short_code, host: Rails.application.config.default_host)
  end

  def to_param
    short_code
  end

  private

  def generate_short_code
    self.short_code ||= loop do
      code = SecureRandom.urlsafe_base64(6)
      break code unless Url.exists?(short_code: code)
    end
  end
end
