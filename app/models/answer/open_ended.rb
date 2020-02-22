module Answer
  class OpenEnded < Base
    validates :body, length: { maximum: 256 }
  end
end
