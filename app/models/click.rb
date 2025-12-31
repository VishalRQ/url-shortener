class Click < ApplicationRecord
  belongs_to :url, counter_cache: :clicks
end
