# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    street "1160 Hanover Street"
    city "Hanover"
    state "Massachusetts"
    postal_code "02339"
    description "Single family home"
  end
end
