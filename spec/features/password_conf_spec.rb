feature 'Feature: password confirmation' do
  scenario 'user fills in mismatching 2nd password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

end
