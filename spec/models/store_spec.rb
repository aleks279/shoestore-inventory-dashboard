require 'rails_helper'

describe Store do
  describe 'associations' do
    it { is_expected.to have_many(:shoes) }
  end
end
