require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      login: "Login",
      password: "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Login/)
    expect(rendered).to match(/Password/)
  end
end
