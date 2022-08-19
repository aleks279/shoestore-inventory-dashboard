require 'rails_helper'

describe Shoe do
  describe 'associations' do
    it { is_expected.to belong_to(:store) }
  end
end
