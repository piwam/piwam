require 'rails_helper'

describe Status do
  it 'has a valid factory' do
    expect(FactoryBot.create(:status)).to be_valid
  end
end
