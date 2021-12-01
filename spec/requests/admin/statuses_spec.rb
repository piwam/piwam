require 'rails_helper'

describe '/admin/statuses' do

  let(:valid_attributes) { { label: 'President' } }
  let(:invalid_attributes) { { label: nil } }

  describe 'GET /index' do
    it 'renders a successful response' do
      Status.create! valid_attributes
      get admin_statuses_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      status = Status.create! valid_attributes
      get admin_status_url(status)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_admin_status_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      status = Status.create! valid_attributes
      get edit_admin_status_url(status)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Status' do
        expect {
          post admin_statuses_url, params: { status: valid_attributes }
        }.to change(Status, :count).by(1)
      end

      it 'redirects to the created status' do
        post admin_statuses_url, params: { status: valid_attributes }
        expect(response).to redirect_to(admin_status_url(Status.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Status' do
        expect {
          post admin_statuses_url, params: { status: invalid_attributes }
        }.to change(Status, :count).by(0)
      end

      it 'renders a successful response (i.e. to display the "new" template)' do
        post admin_statuses_url, params: { status: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { label: 'Secretary' } }

      it 'updates the requested status' do
        status = Status.create! valid_attributes
        patch admin_status_url(status), params: { status: new_attributes }
        status.reload
        expect(status.label).to eq('Secretary')
      end

      it 'redirects to the status' do
        status = Status.create! valid_attributes
        patch admin_status_url(status), params: { status: new_attributes }
        status.reload
        expect(response).to redirect_to(admin_status_url(status))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response (i.e. to display the "edit" template)' do
        status = Status.create! valid_attributes
        patch admin_status_url(status), params: { status: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested status' do
      status = Status.create! valid_attributes
      expect {
        delete admin_status_url(status)
      }.to change(Status, :count).by(-1)
    end

    it 'redirects to the statuses list' do
      status = Status.create! valid_attributes
      delete admin_status_url(status)
      expect(response).to redirect_to(admin_statuses_url)
    end
  end
end
