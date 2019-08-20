FactoryBot.define do 
  factory :user do 
    sequence(:email) {|n| "john_doe_#{n}@example.com"}
    first_name {"John"}
    last_name {"Doe"}
    is_admin {true}
    phone {"+237 677-941-484"}
    password {"johndoe_2019"}
  end

  factory :guest, parent: :user do 
    is_admin {false}
  end
end

