class Type < ApplicationRecord
	has_and_belongs_to_many :exercises
  
  def self.search(search)
    if search
      #Type.where("name LIKE ?", "%" + search + "%")
      type = Type.find_by(name: search)
    else
      Type.all
    end
  end
end
