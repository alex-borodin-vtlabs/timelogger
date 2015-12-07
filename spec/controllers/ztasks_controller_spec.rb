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

RSpec.describe ZtasksController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Ztask. As you add validations to Ztask, be sure to
  # adjust the attributes here as well.
  let(:zproject) {
  	FactoryGirl.create(:zproject)
  }
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:ztask)
  }

  let(:invalid_attributes) {
    { name:''}
  }
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ZtasksController. Be sure to keep this updated too.
  let(:valid_session) { {} }


  describe "GET #show" do
    it "assigns the requested ztask as @ztask" do
      ztask = Ztask.create! valid_attributes
      get :show, {id: ztask.to_param, zproject_id:  zproject.id}, valid_session
      expect(assigns(:ztask)).to eq(ztask)
    end
  end

  describe "GET #new" do
    it "assigns a new ztask as @ztask" do
      get :new, { zproject_id:  zproject.id}, valid_session
      expect(assigns(:ztask)).to be_a_new(Ztask)
    end
  end

  describe "GET #edit" do
    it "assigns the requested ztask as @ztask" do
      ztask = Ztask.create! valid_attributes
      get :edit, {id: ztask.to_param, zproject_id:  zproject.id}, valid_session
      expect(assigns(:ztask)).to eq(ztask)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Ztask" do
        expect {
          post :create, {ztask: valid_attributes, zproject_id: zproject.id}, valid_session
        }.to change(Ztask, :count).by(1)
      end

      it "assigns a newly created ztask as @ztask" do
        post :create, {ztask: valid_attributes, zproject_id:  zproject.id}, valid_session
        expect(assigns(:ztask)).to be_a(Ztask)
        expect(assigns(:ztask)).to be_persisted
      end

      it "redirects to the created ztask" do
        post :create, {ztask: valid_attributes, zproject_id:  zproject.id}, valid_session
        expect(response).to redirect_to(zproject_ztask_path(zproject, Ztask.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved ztask as @ztask" do
        post :create, {ztask: invalid_attributes, zproject_id: zproject.id}, valid_session
        expect(assigns(:ztask)).to be_a_new(Ztask)
      end

      it "re-renders the 'new' template" do
        post :create, {ztask: invalid_attributes, zproject_id:  zproject.id}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested ztask" do
        ztask = Ztask.create! valid_attributes
        put :update, {id: ztask.to_param, ztask: valid_attributes, zproject_id:   zproject.id}, valid_session
        ztask.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested ztask as @ztask" do
        ztask = Ztask.create! valid_attributes
        put :update, {id: ztask.to_param, ztask: valid_attributes, zproject_id:   zproject.id}, valid_session
        expect(assigns(:ztask)).to eq(ztask)
      end

      it "redirects to the ztask" do
        ztask = Ztask.create! valid_attributes
        put :update, {id: ztask.to_param, ztask: valid_attributes, zproject_id:  zproject.id}, valid_session
        expect(response).to redirect_to(zproject_ztask_path(zproject, ztask))
      end
    end

    context "with invalid params" do
      it "assigns the ztask as @ztask" do
        ztask = Ztask.create! valid_attributes
        put :update, {id: ztask.to_param, ztask: invalid_attributes, zproject_id: zproject.id}, valid_session
        expect(assigns(:ztask)).to eq(ztask)
      end

      it "re-renders the 'edit' template" do
        ztask = Ztask.create! valid_attributes
        put :update, {id: ztask.to_param, ztask: invalid_attributes, zproject_id: zproject.id}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested ztask" do
      ztask = Ztask.create! valid_attributes
      expect {
        delete :destroy, {id: ztask.to_param, zproject_id: zproject.id}, valid_session
      }.to change(Ztask, :count).by(-1)
    end

    it "redirects to the ztasks list" do
      ztask = Ztask.create! valid_attributes
      delete :destroy, {id: ztask.to_param, zproject_id: zproject.id}, valid_session
      expect(response).to redirect_to(zproject_path(zproject))
    end
  end

end
