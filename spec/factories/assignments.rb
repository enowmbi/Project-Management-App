FactoryBot.define do 
  factory :assignment do 
    assigned_on {Time.now}
    status {"resolved"}
    resolved_on {Time.now}
    user
    issue
  end
end
