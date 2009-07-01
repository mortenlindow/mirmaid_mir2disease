
class Mature < ActiveRecord::Base
  has_many :m2d_disease_links
  
  def test
    puts "this is a test!"
  end

end
