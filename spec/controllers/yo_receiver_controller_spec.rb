require 'rails_helper'

RSpec.describe YoReceiverController, type: :controller do
  let(:yo_username) { 'LIPOQIL' }
  let(:yo_params) { { username: yo_username, user_ip: '172.31.13.173' } }

  describe 'GET #prepare' do
    it 'returns http success' do
      # /yo_receiver/prepare?username=LIPOQIL&user_ip=172.31.13.173
      get :prepare, params: yo_params
      expect(response).to have_http_status(:success)
    end

    context 'with link' do
      let(:yo_params_with_link) {
        yo_params.merge(link: URI.escape('https://www.paralelnipolis.cz/program/transhumanismus/'))
      }

      it 'sends >new< watching link for new link' do
        expect(subject).to receive :prepare_link
        get :prepare, params: yo_params_with_link
      end

    end
  end

  describe 'GET #subscribed' do
    it 'returns http success' do
      get :subscribed, params: yo_params
      expect(response).to have_http_status(:success)
    end

    it 'creates user' do
      expect {
        get :subscribed, params: yo_params
      }.to change{ Yuser.count }.by 1
    end
  end

  describe '#prepare_link' do
    let(:yo_params_with_link) {
      yo_params.merge(link: URI.escape('https://www.paralelnipolis.cz/program/transhumanismus/'))
    }

    context 'for new watching' do
      it 'sends >new< watching link for new link' do
        link_preparation = subject.prepare_link yo_username, 'https://www.paralelnipolis.cz/program/transhumanismus/'
        expect(link_preparation).to be true
      end
    end

    context 'for existing watching' do
      it 'sends >new< watching link for new link' do
        watched_url = 'https://www.paralelnipolis.cz/program/transhumanismus/'
        Watching.create url: watched_url

        link_preparation = subject.prepare_link yo_username, watched_url
        expect(link_preparation).to be true
      end
    end



  end

end
