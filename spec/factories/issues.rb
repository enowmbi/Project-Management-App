FactoryBot.define do 
  factory :issue do 
    sequence(:title) {|n| "Issue #{n}"}
    description {"Description of #{title}"}
    severity {"high"}
    status {"resolved"}
    project
  end
end
