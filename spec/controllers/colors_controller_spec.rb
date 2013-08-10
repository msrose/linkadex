require 'spec_helper'

describe ColorsController do
  it "triggers edit mode" do
    controller.should be_edit_mode
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index
      response.should render_template :index
    end

    it "populates an array of colors" do
      color = FactoryGirl.create(:color)
      get :index
      assigns(:colors).should include(color)
    end

    it "sets the title of the page" do
      get :index
      assigns(:title).should == 'Colors - Linkage'
    end
  end

  describe "GET #new" do
    before { xhr :get, :new }

    it "returns a success response" do
      response.status.should == 200
    end

    it "initializes a new color" do
      assigns(:color).should be_present
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "adds a color to the database" do
        expect { xhr :post, :create, :color => FactoryGirl.attributes_for(:color) }.to change(Color, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not add a color to the database" do
        expect { xhr :post, :create, :color => FactoryGirl.attributes_for(:color, :hex_value => "invalid!") }.not_to change(Color, :count)
      end
    end
  end

  describe "GET #edit" do
    before do
      @color = FactoryGirl.create(:color)
      xhr :get, :edit, :id => @color.id
    end

    it "returns a success status" do
      response.status.should == 200
    end

    it "finds the correct color" do
      assigns(:color).should == @color
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "updates the color" do
        color = FactoryGirl.create(:color)
        new_attrs = FactoryGirl.attributes_for(:color)
        xhr :put, :update, :id => color.id, :color => new_attrs
        color.reload
        color.hex_value.should == new_attrs[:hex_value]
      end
    end

    context "with invalid attributes" do
      it "does not update the color" do
        color = FactoryGirl.create(:color)
        old_hex = color.hex_value
        xhr :put, :update, :id => color.id, :color => FactoryGirl.attributes_for(:color, :hex_value => "Blah!")
        color.reload
        color.hex_value.should == old_hex
      end
    end
  end

  describe "DELETE #destroy" do
    before { @color = FactoryGirl.create(:color) }

    context "when the color is not in use" do
      it "deletes the color" do
        @color.should_not be_in_use
        expect { xhr :delete, :destroy, :id => @color.id }.to change(Color, :count).by(-1)
      end
    end

    context "when the color is in use" do
      before { FactoryGirl.create(:group, :color_id => @color.id) }

      it "does not delete the color" do
        @color.should be_in_use
        expect { xhr :delete, :destroy, :id => @color.id }.not_to change(Color, :count)
      end
    end
  end
end
