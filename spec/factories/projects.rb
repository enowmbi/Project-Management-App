FactoryBot.define do 
  factory :project do 
    sequence(:name) {|n| "project #{n}"}
    description {"This is a description of #{:name}"}
    duration {1}
    status {"Deployed"}
  end
end
