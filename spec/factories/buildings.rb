# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    street "1160 Hanover Street"
    city "Hanover"
    state "Massachusetts"
    postal_code "02339"
    description "Single family home"

    factory :building_with_owners do
      after(:create) do |building|
        building.owners << FactoryGirl.create(:owner)
        # create_list(:owner, 2, buildings: [building])
      end
    end
  end
end
