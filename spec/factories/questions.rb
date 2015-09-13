FactoryGirl.define do

  factory :question do
    title { Faker::Lorem.sentence }
    question_type { [:text, :radio, :checkbox, :slider].sample }
  end

  [:text, :radio, :checkbox, :slider].each do |type|
    trait type do
      question_type { type }
      if type == :slider
        data { [100, 1000] }
      elsif type == :radio || type == :checkbox 
        data { (1..5).map{ Faker::Lorem.words(2).join(" ") }  }
      end
    end
  end

  trait :with_form do
    form
  end

end
