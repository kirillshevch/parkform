FactoryGirl.define do
  factory :form do
    start_at { Time.now } 
    finish_at { 1.year.from_now } 
    title { Faker::Lorem.sentence } 
    description { Faker::Lorem.sentence  }
    questions {
      create_list(:question, 3, :radio) + 
      create_list(:question, 3, :checkbox) +
      create_list(:question, 3, :slider) +
      create_list(:question, 3, :text)
    }
    user

    trait :with_responses do
      responses { create_list(:response, 12) }
      after(:create) do |form|
        form.responses.each do |r|
          data = []
          form.questions.each do |q|
            value = Faker::Lorem.words(3).join(" ")
            value = q.data.sample if q.question_type.to_s == "checkbox" || q.question_type.to_s == "radio"
            value = [rand(100..1000), rand(100..1000)] if q.question_type.to_s == "slider"
            data << [ q.id, value ]        
          end 
          r.update!(data: data)
        end
      end
    end 

  end
end
