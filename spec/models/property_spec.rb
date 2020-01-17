require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
end
