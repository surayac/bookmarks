# typed: strict

class Bookmark < ApplicationRecord
  extend T::Sig

  before_validation :normalize_url

  validates :title, presence: true
  validates :url,
    presence: true,
    format: {
      with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
      message: "must be a valid URL"
    }

  sig { returns(T.nilable(String)) }
  def normalized_url
    url&.strip
  end

  private

  sig { void }
  def normalize_url
    self.url = normalized_url
  end
end
