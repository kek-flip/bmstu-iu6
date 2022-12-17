require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        login: "Login1",
        password: "Password"
      ),
      User.create!(
        login: "Login2",
        password: "Password"
      )
    ])
  end

  it "renders a list of users" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Login".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Password".to_s), count: 2
  end
end
