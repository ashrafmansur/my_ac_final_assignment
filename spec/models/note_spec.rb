require 'rails_helper'

RSpec.describe Note, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:likes) }

  it { should validate_presence_of(:body) }
end
