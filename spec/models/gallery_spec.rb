require 'rails_helper'

RSpec.describe Gallery, :type => :model do
  it "will not save gallery without a name" do
    expect(Gallery.new(name: nil)).not_to be_valid
  end
end
