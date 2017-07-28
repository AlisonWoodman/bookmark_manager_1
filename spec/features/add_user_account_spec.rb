feature 'Feature: user sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("alice@example.com")
    expect(User.first.email).to eq("alice@example.com")
  end

  scenario 'I cannot sign up without entering an email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'I cannot sign up using an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end
end
