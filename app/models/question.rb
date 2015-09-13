class Question < ActiveRecord::Base
  belongs_to :form
  enum question_type: {
    text:       0,
    radio:      1,
    checkbox:   2,
    slider:     3
  }
end
