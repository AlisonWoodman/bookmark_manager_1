def submit_test_link(url, title, tag = "NA")
  visit('/links/new')
  fill_in :url, with: "#{url}"
  fill_in :title, with: "#{title}"
  fill_in :tags, with: "#{tag}"
  click_button "Submit"
end

def sign_up(email: 'alice@example.com',
            password: '12345678',
            password_confirmation: '12345678')
  visit('/users/new')
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "Sign up"
end

def sign_in(email:,
            password:)
  visit('/sessions/new')
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def sign_out
end
