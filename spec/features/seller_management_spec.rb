require 'rails_helper'

RSpec.feature 'seller management', :type => :feature do
  scenario 'user authentication' do
    visit 'sellers/sign_in'
    click_button 'Log in'
    expect(page).to have_http_status(200)
    expect(page).to render_template('products/_product.html.erb')
  end
end
