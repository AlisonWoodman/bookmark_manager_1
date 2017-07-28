feature 'Feature: signing out' do

  let!(:user) do
    User.create(email: 'alice@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'allows user to sign out' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    expect(page).to have_content 'Ciao!'
    expect(page).not_to have_content "Welcome, #{user.email}"
    expect(current_path).to eq '/links'
  end
end
