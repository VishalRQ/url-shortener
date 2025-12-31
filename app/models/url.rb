class Url < ApplicationRecord
  validates :original_url, presence: true, format: URI.regexp(%w[http https])
  validates :short_code, uniqueness: true

  before_validation :generate_short_code, on: :create

  def short_url
    "http://localhost:3000/s/#{short_code}"
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
