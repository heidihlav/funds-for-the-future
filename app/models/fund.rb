class Fund < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true, uniqueness: true
    validates :age, presence: true
end

