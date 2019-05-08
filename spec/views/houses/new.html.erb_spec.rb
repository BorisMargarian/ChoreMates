require 'rails_helper'

RSpec.describe "houses/new", type: :view do
  before(:each) do
    assign(:house, House.new())
  end

  it "renders new house form" do
    render

    assert_select "form[action=?][method=?]", houses_path, "post" do
    end
  end
end
