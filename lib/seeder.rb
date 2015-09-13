module Seeder extend self

  def add_user
    user = User.find_by(email: "test@mail.com")
    FactoryGirl.create(:user, email: "test@mail.com", password: "password", password_confirmation: 'password') if user.nil?
  end

  def create_forms_with_responces(count=24)
    FactoryGirl.create_list(:form, count, :with_responses)
  end

end
