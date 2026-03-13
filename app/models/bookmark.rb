class Bookmark < ApplicationRecord
    extend T::Sig

    sig { returns(String)}
    def normalized_url
        url.strip.downcase
    end
    
end
