feature 'FEATURE: creating links' do
  scenario 'the user can add a new bookmark to the database' do
    submit_test_link('www.google.com', 'Google')
    expect(page).to have_content('www.google.com')
  end
end
