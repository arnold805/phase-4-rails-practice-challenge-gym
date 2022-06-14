class Gym < ApplicationRecord
    # dependent: :destroy delets membership association when gym is deleted
    has_many :memberships, dependent: :destroy
    has_many :clients, through: :memberships
end
