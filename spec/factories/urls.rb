FactoryBot.define do
  factory :url do
    original_url { "https://example.com" }
    short_code   { SecureRandom.alphanumeric(6) }
    clicks       { 0 }
  end
end
