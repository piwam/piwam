require 'rails_helper'

describe Admin::StatusesController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/statuses').to route_to('admin/statuses#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/statuses/new').to route_to('admin/statuses#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/statuses/1').to route_to('admin/statuses#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/statuses/1/edit').to route_to('admin/statuses#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/statuses').to route_to('admin/statuses#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/statuses/1').to route_to('admin/statuses#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/statuses/1').to route_to('admin/statuses#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/statuses/1').to route_to('admin/statuses#destroy', id: '1')
    end
  end
end
