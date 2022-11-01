require 'rails_helper'

RSpec.describe PostsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/posts').to route_to('posts#index')
    end

    it 'routes to #show' do
      expect(get: '/posts/1').to route_to('posts#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/posts').to route_to('posts#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/posts/1').to route_to('posts#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/posts/1').to route_to('posts#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/posts/1').to route_to('posts#destroy', id: '1')
    end

    it 'routes /posts to the posts controller' do
      expect(get('/posts')).to route_to('posts#index')
    end

    it 'does not route to tags' do
      expect(get('/tags')).not_to be_routable
    end

    it 'allows https route for posts' do
      expect(get('https://127.0.0.1:3000/posts')).to be_routable
    end

    it 'allows http route for posts' do
      expect(get('http://127.0.0.1:3000/posts')).to be_routable
    end

    it 'allows http route for articles' do
      expect(get('http://127.0.0.1:3000/articles')).not_to be_routable
    end

    it 'routes posts_path to the posts controller' do
      expect(get(posts_path)).to route_to('posts#index')
    end
    it 'routes admin/posts to the admin::posts controller' do
      expect(get('admin/posts')).to route_to('admin/posts#index')
    end
    it 'routes /posts/post_name to the posts controller' do
      expect(get('/posts/post_name')).to route_to(
        controller: 'posts',
        action: 'show',
        id: 'post_name'
      )
    end
  end
end
