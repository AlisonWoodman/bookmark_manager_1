require_relative 'web_helpers'

feature 'Password confirmation' do

  scenario 'fills in mismatching 2nd password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

end
