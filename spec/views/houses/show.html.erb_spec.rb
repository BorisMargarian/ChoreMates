require 'rails_helper'

RSpec.describe "houses/show", type: :view do
  before(:each) do
    @house = assign(:house, House.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
