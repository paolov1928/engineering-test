FactoryBot.define do
  factory :experience, class: "Experience" do
    name { Faker::Book.title }
    overview { Faker::Hipster.paragraph }
    tagline { Faker::Hipster.sentence }
  end
end
