require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  describe "#reserve" do
    context "some check boxes have been selected" do
      let(:user) {User.new}
      subject { post :reserve, :records => ["1,2", "1,3", "2,2"] }
      before do
        allow(User).to receive(:find_by).and_return(user)
        allow(user).to receive(:id).and_return(1)
        allow(session).to receive(:[]).with(anything)
        allow(session).to receive(:[]).with(:user_id).and_return(1)
      end
      it " makes a new reservation and redirect to user_url" do
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
