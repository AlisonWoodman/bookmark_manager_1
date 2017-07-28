feature 'Feature: adding one tag' do
  scenario 'the user can add tags to a link' do
    submit_test_link('www.google.com', 'Google', 'Browser')
    expect(page).to have_content('Browser')
  end

  scenario 'the user can add mulitple tags to a link' do
    submit_test_link('www.google.com', 'Google', 'Browser, Work')
    expect(page).to have_content('Browser')
    expect(page).to have_content('Work')
  end
end
