require 'rails_helper'

describe 'admin/statuses/index' do
  before(:each) do
    assign(:statuses, [
      FactoryBot.create(:status, label: 'President'),
      FactoryBot.create(:status, label: 'Secretary')
    ])
  end

  it 'renders a list of statuses' do
    render
    assert_select 'tr>td', text: 'President', count: 1
    assert_select 'tr>td', text: 'Secretary', count: 1
  end
end
