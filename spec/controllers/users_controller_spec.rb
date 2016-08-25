require 'rails_helper'

describe UsersController do

  let(:user){ create(:user) }

  context "when user is not signed in" do

    it "users#show will not render for visitor" do
      get :show, id: user.id
      expect(response).to_not render_template :show
    end

  end

  context "when user is signed in" do

    before do
      request.session[:user_id] = user.id
    end

    it "users#show will render for signed in user" do
      get :show, id: user.id
      expect(response).to render_template :show
    end

  end


end