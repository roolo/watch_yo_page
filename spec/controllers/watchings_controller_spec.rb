require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe WatchingsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Watching. As you add validations to Watching, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for :watching
  }

  let(:invalid_attributes) {
    {url: 'frkul'}
  }

  let(:required_params) { {username: 'LIPOQIL'}   }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WatchingsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all watchings as @watchings' do
      watching = Watching.create! valid_attributes
      get :index, params: required_params, session: valid_session
      expect(assigns(:watchings)).to eq([watching])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested watching as @watching' do
      watching = Watching.create! valid_attributes
      get :show, params: required_params.merge(id: watching.to_param), session: valid_session
      expect(assigns(:watching)).to eq(watching)
    end
  end

  describe 'GET #new' do
    it 'assigns a new watching as @watching' do
      get :new, params: required_params, session: valid_session
      expect(assigns(:watching)).to be_a_new(Watching)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested watching as @watching' do
      watching = Watching.create! valid_attributes
      get :edit, params: required_params.merge(id: watching.to_param), session: valid_session
      expect(assigns(:watching)).to eq(watching)
    end
  end

  describe 'GET #stop_watching_query' do
    it 'is able to load' do
      watching = Watching.create! valid_attributes
      get :stop_watching_query, params: required_params.merge(id: watching.to_param)
      expect(assigns(:watching)).to eq(watching)
    end

    it 'assigns the requested watching as @watching' do
      watching = Watching.create! valid_attributes
      get :stop_watching_query, params: required_params.merge(id: watching.to_param)
      expect(assigns(:watching)).to eq(watching)
    end
  end



  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Watching' do
        expect {
          post :create,
               params: required_params.merge(watching: valid_attributes),
               session: valid_session
        }.to change(Watching, :count).by(1)
      end

      it 'assigns a newly created watching as @watching' do
        post :create, params: required_params.merge(watching: valid_attributes), session: valid_session
        expect(assigns(:watching)).to be_a(Watching)
        expect(assigns(:watching)).to be_persisted
      end

      it 'redirects to the created watching' do
        post :create, params: required_params.merge(watching: valid_attributes), session: valid_session
        expect(response).to redirect_to(Watching.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved watching as @watching' do
        post :create, params: required_params.merge(watching: invalid_attributes), session: valid_session
        expect(assigns(:watching)).to be_a_new(Watching)
      end

      it 're-renders the >new< template' do
        post :create, params: required_params.merge(watching: invalid_attributes), session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { url: 'http://si.com' } }

      it 'updates the requested watching' do
        watching = Watching.create! valid_attributes
        put :update, params: required_params.merge(id: watching.to_param, watching: new_attributes), session: valid_session
        watching.reload
        expect(watching.url).to eq new_attributes[:url]
      end

      it 'assigns the requested watching as @watching' do
        watching = Watching.create! valid_attributes
        put :update,
            params: required_params.merge(id: watching.to_param, watching: valid_attributes),
            session: valid_session
        expect(assigns(:watching)).to eq(watching)
      end

      it 'redirects to the watching' do
        watching = Watching.create! valid_attributes
        put :update,
            params: required_params.merge(id: watching.to_param, watching: valid_attributes),
            session: valid_session
        expect(response).to redirect_to(watching)
      end
    end

    context 'with invalid params' do
      it 'assigns the watching as @watching' do
        watching = Watching.create! valid_attributes
        put :update, params: required_params.merge(id: watching.to_param, watching: invalid_attributes), session: valid_session
        expect(assigns(:watching)).to eq(watching)
      end

      it 're-renders the >edit< template' do
        watching = Watching.create! valid_attributes
        put :update, params: required_params.merge(id: watching.to_param, watching: invalid_attributes), session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested watching' do
      watching = Watching.create! valid_attributes
      expect {
        delete :destroy, params: required_params.merge(id: watching.to_param), session: valid_session
      }.to change(Watching, :count).by(-1)
    end

    it 'redirects to the watchings list' do
      watching = Watching.create! valid_attributes
      delete :destroy, params: required_params.merge(id: watching.to_param), session: valid_session
      expect(response).to redirect_to(watchings_url)
    end
  end

end
