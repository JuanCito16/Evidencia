class Person < ApplicationRecord
  belongs_to :document
  belongs_to :role
end
