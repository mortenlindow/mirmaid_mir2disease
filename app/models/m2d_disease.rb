# == Schema Information
#
# Table name: m2d_diseases
#
#  id   :integer         not null, primary key
#  doid :integer
#  name :string(255)
#


class M2dDisease < ActiveRecord::Base
  has_many :m2d_disease_links
  
  def self.find_rest(id)
    self.find_by_doid(id)
  end

  def to_param
    self.doid.to_s
  end
 
end
