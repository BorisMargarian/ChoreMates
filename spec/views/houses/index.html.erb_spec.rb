require 'rails_helper'

RSpec.describe "houses/index", type: :view do
  before(:each) do
    assign(:houses, [
      House.create!(),
      House.create!()
    ])
  end

  it "renders a list of houses" do
    render
  end
end
