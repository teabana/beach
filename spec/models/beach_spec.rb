require 'rails_helper'

RSpec.describe Beach, type: :model do
  before do
    user = FactoryBot.create(:user)
    beach = FactoryBot.create(:beach)
    activity = FactoryBot.create(:beach_activity, beach_id: beach.id, user_id: user.id)
    facility = FactoryBot.create(:beach_facility, beach_id: beach.id, user_id: user.id)
    @beach_form = FactoryBot.build(:beach_formobject, user_id: user.id ,activity_id: activity.id, facility_id: facility.id)
  end

  describe 'ビーチ登録' do
    context 'ビーチ登録可能' do
      it '必要情報を全て入力すると登録できる' do
        binding.pry
        expect(@beach_form).to be_valid
      end
    end

    context 'ビーチ登録不可' do
      it 'nameが空では登録できない' do
        @beach_form.name = ''
        @beach_form.valid?
        expect(@beach_form.errors.full_messages).to include("Name can't be blank")
      end

      it 'detailが空では登録できない' do
        @beach_form.detail = ''
        @beach_form.valid?
        expect(@beach_form.errors.full_messages).to include("Detail can't be blank")
      end

      it 'area_idが空では登録できない' do
        @beach_form.area_id = ''
        @beach_form.valid?
        expect(@beach_form.errors.full_messages).to include("Area can't be blank")
      end

      it 'imageが空では登録できない' do
        @beach_form.image = nil
        @beach_form.valid?
        expect(@beach_form.errors.full_messages).to include("Image can't be blank")
      end

      it 'activitty_idが空では登録できない' do
        @beach_form.activity_id = ''
        @beach_form.valid?
        expect(@beach_form.errors.full_messages).to include("Activity can't be blank")
      end
      it 'facility_idが空では登録できない' do
        @beach_form.facility_id = ''
        @beach_form.valid?
        expect(@beach_form.errors.full_messages).to include("Facility can't be blank")
      end
    end
  end
end

