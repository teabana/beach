require 'rails_helper'

RSpec.describe "ユーザ新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザ新規登録ができる時' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに遷移する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Signup')
      # サインアップページへ遷移する
      visit new_user_registration_path
      # ユーザ情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password_confirmation', with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページに遷移したことを確認する
      expect(current_path).to eq(root_path)
      # トップページにログアウトボタンが表示されることを確認する
      expect(page).to have_content('Signout')
      # サインアップ、サインインへ遷移するボタンがないことを確認する
      expect(page).to have_no_content('Signup')
      expect(page).to have_no_content('Signin')
    end
  end

  context 'ユーザ新規登録がでない時' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページに戻ってくる' do
      # トップページに遷移する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Signup')
      # サインアップページへ遷移する
      visit new_user_registration_path
      # ユーザ情報を入力する
      fill_in 'nickname', with: ''
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      fill_in 'password_confirmation', with: ''
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # トップページに遷移したことを確認する
      expect(current_path).to eq(user_registration_path)
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @admin = FactoryBot.create(:user, admin: true)
    @beach = FactoryBot.create(:beach)
    # activity = FactoryBot.create(:beach_activity, beach_id: @beach.id, user_id: @admin.id)
    # facility = FactoryBot.create(:beach_facility, beach_id: @beach.id, user_id: @admin.id)
    # @beach_form = FactoryBot.build(:beach_formobject,
    #   name: @beach.name, detail: @beach.detail, area_id: @beach.area_id, image: @beach.image,
    #   user_id: @admin.id ,activity_id: Faker::Number.within(range: 1..4),
    #   facility_id: Faker::Number.within(range: 1..4)
    # )
  end
  context '一般ユーザでログインできる時' do
    it '正しい情報を入力すればログインができてトップページに移動する' do
      # トップページに遷移する
      visit root_path
      # トップページにサインインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Signin')
      # サインインページへ遷移する
      visit new_user_session_path
      # ユーザ情報を入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      # ログインボタンを押下する
      find('input[name="commit"]').click
      # トップページに遷移したことを確認する
      expect(current_path).to eq(root_path)
      # トップページにログアウトボタンが表示されることを確認する
      expect(page).to have_content('Signout')
      # サインアップ、サインイン、Newボタンへ遷移するボタンがないことを確認する
      expect(page).to have_no_content('Signup')
      expect(page).to have_no_content('Signin')
      expect(page).to have_no_content('New')
    end
  end
  context 'adminユーザでログインした時' do
    it 'adminユーザでログインした場合' do
      # トップページに遷移する
      visit root_path
      # トップページにサインインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Signin')
      # サインインページへ遷移する
      visit new_user_session_path
      # ユーザ情報を入力する
      fill_in 'email', with: @admin.email
      fill_in 'password', with: @admin.password
      # ログインボタンを押下する
      find('input[name="commit"]').click
      # トップページに遷移したことを確認する
      expect(current_path).to eq(root_path)
      # トップページにログアウトボタン、Newボタンが表示されることを確認する
      expect(page).to have_content('Signout')
      expect(page).to have_content('New')
      # サインアップ、サインインへ遷移するボタンがないことを確認する
      expect(page).to have_no_content('Signup')
      expect(page).to have_no_content('Signin')
      # Newボタン押下時にNewページが表示されることを確認する
      visit new_beach_path
      expect(current_path).to eq(new_beach_path)
      # searchボタン押下時にビーチ一覧ページに遷移できることを確認する。
      visit beach_search_path
      expect(current_path).to eq(beach_search_path)
=begin
      # ビーチ画像押下時に詳細ページに遷移できることを確認する。
      find('img[class="beach_box_img"]').click
      expect(current_path).to eq(beach_path(@beach.id))
      # edit,deleteボタンがあることを確認する
      expect(page).to have_content('Edit')
      expect(page).to have_content('Delete')
      # editボタン押下時に編入ページに遷移できることを確認する。
      find('a[class="beach_edit_btn]').click
      expect(current_path).to eq(edit_beach_path(@beach.id))
=end
    end
  end
  context 'ログインできない時' do
    it '誤った情報ではログインができずにログインページに戻ってくる' do
      # トップページに遷移する
      visit root_path
      # トップページにサインインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Signup')
      # サインインページへ遷移する
      visit new_user_session_path
      # ユーザ情報を入力する
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      # ログインボタンを押下する
      find('input[name="commit"]').click
      # トップページに遷移したことを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

