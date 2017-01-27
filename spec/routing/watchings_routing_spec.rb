require "rails_helper"

RSpec.describe WatchingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/watchings").to route_to("watchings#index")
    end

    it "routes to #new" do
      expect(:get => "/watchings/new").to route_to("watchings#new")
    end

    it "routes to #show" do
      expect(:get => "/watchings/1").to route_to("watchings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/watchings/1/edit").to route_to("watchings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/watchings").to route_to("watchings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/watchings/1").to route_to("watchings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/watchings/1").to route_to("watchings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/watchings/1").to route_to("watchings#destroy", :id => "1")
    end

  end
end
