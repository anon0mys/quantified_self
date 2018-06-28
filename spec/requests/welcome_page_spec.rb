require 'rails_helper'

describe 'Welcome Page' do
  it 'should exist' do
    get '/'

    expect(response).to be_successful
  end
end
