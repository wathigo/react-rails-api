require 'rails_helper'

RSpec.describe Favourite, type: :model do
  it { should validate_presence_of(:users_id) }
  it { should validate_presence_of(:properties_id) }
end
