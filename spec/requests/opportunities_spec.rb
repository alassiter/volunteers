require 'rails_helper'

RSpec.describe "Opportunities", type: :request do
  describe "GET /opportunities" do
    it "works! (now write some real specs)" do
      get opportunities_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /opportunity/1' do
    # MOVE THESE TO Assignment request spec
    context 'with an existing volunteer' do
      let(:opportunity) { create(:opportunity) }
      let(:volunteer) { create(:volunteer) }

      it 'redirects to opportunity' do
        patch opportunity_path(opportunity), params: { 
          opportunity: { 
            volunteers: {
              email: volunteer.email,
              first_name: volunteer.first_name,
              last_name: volunteer.last_name
            }
          } 
        }

        expect(response).to redirect_to(opportunity_url(opportunity))
        expect(flash[:notice]).to be_present
      end
    end

    context 'with an new volunteer' do
      let(:opportunity) { create(:opportunity) }
      let(:volunteer) { build(:volunteer) }

      before do
        patch opportunity_path(opportunity), params: { 
          opportunity: { 
            volunteers: {
              email: volunteer.email,
              first_name: volunteer.first_name,
              last_name: volunteer.last_name
            }
          } 
        }
      end

      it 'redirects to opportunity' do
        expect(response).to redirect_to(opportunity_url(opportunity))
        expect(flash[:notice]).to be_present
      end

      it 'assigns volunteer' do
        expect(opportunity.volunteers).to include(Volunteer.find_by(email: volunteer.email))
      end
    end

    context 'when trying to assign already assigned volunteer' do
      let(:volunteer) { create(:volunteer) }
      let(:opportunity) { create(:opportunity, volunteers: [volunteer]) }

      it 'redirects to opportunity' do
        patch opportunity_path(opportunity), params: { 
          opportunity: { 
            volunteers: {
              email: volunteer.email,
              first_name: volunteer.first_name,
              last_name: volunteer.last_name
            }
          } 
        }

        expect(response).to redirect_to(opportunities_url)
        expect(flash.keys).to include("alert")
      end
    end
  end
end
