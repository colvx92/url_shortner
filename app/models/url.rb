class Url < ApplicationRecord

  def to_param
    self.short_url
  end

end
