class User < ActiveRecord::Base
  has_secure_password
  has_many :to_dos
  has_many :courses, through: :to_dos

  def slug
    self.username.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    User.all.find{|song| song.slug == slug}
  end

end
