require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  describe "#reserve" do
    context "some check boxes have been selected" do
      subject { post :reserve, :records => ["1,2", "1,3", "2,2"] }
      it "should make a new reservation and redirect to user_url" do
        user = User.new
        user.id = 1
        session[:user_id] = 1
        allow(User).to receive(:find_by).and_return(user)

        expect(Reservation).to receive(:save_records)

        expect(subject).to redirect_to(user_url(user))
      end
    end

    context "no records parameter in post request" do
      it 'should render home if no records parameter is passed' do
        post :reserve
        expect(response).to render_template('index')
      end
    end

  end

end
