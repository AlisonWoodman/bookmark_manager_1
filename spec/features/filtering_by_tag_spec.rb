feature 'FEATURE: filtering by tag' do
  scenario 'the user can view only links with a certain tag' do
    submit_test_link('www.google.com', 'Google', 'Browser')
    submit_test_link('www.bubbles.com', 'Bubbly', 'Bubbles')
    visit 'tags/bubbles'
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Bubbles')
    expect(page).to_not have_content('Google')
  end
end
