class Article < ApplicationRecord
  [:title, :text].each do |v|
    validates v, presence: true
  end
  belongs_to :user
end
