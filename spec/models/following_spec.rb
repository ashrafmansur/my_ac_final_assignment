require 'rails_helper'

RSpec.describe Following, type: :model do
  it { should belong_to(:follower) }
  it { should belong_to(:followee) }
  it { should validate_presence_of(:follower_id) }
  it { should validate_presence_of(:followee_id) }
end
