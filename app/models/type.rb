class Type < ApplicationRecord
	has_and_belongs_to_many :exercises
end
