require 'rails_helper'

describe 'admin/statuses/edit' do
  before(:each) do
    @status = assign(:status, FactoryBot.create(:status))
  end

  it 'renders the edit status form' do
    render

    assert_select 'form[action=?][method=?]', admin_status_path(@status), 'post' do
      assert_select 'input[name=?]', 'status[label]'
    end
  end
end
