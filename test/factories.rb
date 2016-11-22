FactoryGirl.define do
  factory :user do
    name 'John Doe'
    sequence(:email) { |n| "john#{n}@example.org" }
    password 'test'
  end

  factory :task do
    title 'Some task'
    association :user

    trait :completed do
      completed_at { Time.current }
    end
  end
end
