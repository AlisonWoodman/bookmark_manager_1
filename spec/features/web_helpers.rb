def submit_test_link(url, title, tag = "NA")
  visit('/links/new')
  fill_in :url, with: "#{url}"
  fill_in :title, with: "#{title}"
  fill_in :tags, with: "#{tag}"
  click_button "Submit"
end

def sign_up
  visit('/users/new')
  expect(page.status_code).to eq(200)
  fill_in :email_address, with: "test@test.com"
  fill_in :password, with: "password123"
  click_button "Sign up"
end
