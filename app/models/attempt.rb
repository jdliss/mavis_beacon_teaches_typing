class Attempt < ActiveRecord::Base
  belongs_to :level
  validates :text, presence: true

  def percent_correct
    level.text.chars.map.with_index do |char, index|
      char == text.chars[index] ? 1 : 0
    end.reduce(:+)*100/level.text.length
  end
end
