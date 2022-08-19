require 'rails_helper'

describe InventoryReportCreator do
  subject(:call) { described_class.call(store: store, model: model, inventory: inventory) }

  describe '#call' do
    context 'when the store is new' do
      let(:store) { 'new store' }
      let(:model) { 'NEW_MODEL' }
      let(:inventory) { 50 }

      it 'creates the store' do
        expect { call }.to change { Store.count }.from(0).to(1)
      end

      it 'creates the shoe' do
        expect { call }.to change { Shoe.count }.from(0).to(1)
      end

      context 'when store & shoe are created' do
        let(:new_store) { Store.last }
        let(:new_shoe) { new_store.shoes.reload.first }
        let(:broadcast_data) do
          {
            store: store,
            model: model,
            inventory: inventory
          }
        end

        it 'assigns data correctly' do
          call

          expect(new_store.name).to eq store
          expect(new_shoe.model).to eq model
          expect(new_shoe.inventory).to eq inventory
        end

        it { expect { call }.to have_broadcasted_to('InventoryUpdatesChannel').with(broadcast_data) }

        context 'when inventory is too low (< 20)' do
          let(:inventory) { 10 }

          it { expect { call }.to have_broadcasted_to('InventoryAlertsChannel').with(broadcast_data) }          
        end
      end
    end

    context 'when the store already exits' do
      let!(:existing_store) { create(:store, name: 'some store') }
      let(:store) { existing_store.name }
      let(:model) { 'NEW_MODEL' }
      let(:inventory) { 50 }

      it 'does not create a new store' do
        expect { call }.to_not change { Store.count }
      end

      it 'creates the shoe' do
        expect { call }.to change { Shoe.count }.from(0).to(1)
      end

      context 'when the shoe already exists' do
        let!(:existing_shoe_model) { create(:shoe, store: existing_store, model: 'EXISTING_MODEL', inventory: 40) }
        let(:store) { existing_store.name }
        let(:model) { existing_shoe_model.model }
        let(:inventory) { 50 }

        it 'creates the shoe' do
          expect { call }.to_not change { Shoe.count }
        end

        it 'updates inventory in existing shoe model' do
          expect { call }.to change { existing_shoe_model.reload.inventory }.from(40).to(50)
        end
      end
    end
  end
end
