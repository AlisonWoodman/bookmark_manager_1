require_relative 'web_helpers'

feature 'FEATURE: adding tags' do
  scenario 'the user can add tags to a link' do
    submit_test_link('www.google.com', 'Google', 'Browser')
    expect(page).to have_content('Browser')
  end
end
