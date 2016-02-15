FactoryGirl.define do
    # Define a basic devise user.
    factory :user do
        password "example1"
        password_confirmation "example1"
        factory :first_user do
            id 1
            email "ple@example.com"
        end
        factory :second_user do
            id 2
            email "ample@example.com"
        end
    end

end
