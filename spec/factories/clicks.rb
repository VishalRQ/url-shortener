FactoryBot.define do
  factory :click do
    association :url
    ip { "127.0.0.1" }
    user_agent { "RSpec Test Agent" }
  end
end
