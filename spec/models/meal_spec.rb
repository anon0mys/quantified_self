require 'rails_helper'

describe Meal do
  context 'attributes' do
    it { should validate_presence_of :name }
  end
end
