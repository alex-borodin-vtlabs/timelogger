module RequestMacros
  def login_user
    before(:each) do
      user = FactoryGirl.create(:first_user)
      user.confirm
      @second_user = FactoryGirl.create(:second_user)
      @second_user.confirm
      post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
    end
  end
end
