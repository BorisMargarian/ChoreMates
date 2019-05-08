require 'rails_helper'

RSpec.describe "houses/edit", type: :view do
  before(:each) do
    @house = assign(:house, House.create!())
  end

  it "renders the edit house form" do
    render

    assert_select "form[action=?][method=?]", house_path(@house), "post" do
    end
  end
end
