FactoryBot.define do
  factory :membership do
    user { nil }
    team { nil }
    owner { false }
  end
end
