# spec/system/brag_document_spec.rb
require 'rails_helper'

RSpec.describe 'Brag Document', type: :system do
  it 'renders page with core sections and image' do
    visit(brag_path)

    expect(page).to have_title('My Brag Document')
    expect(page).to have_selector('h1', text: 'PEEMAI 2025')
    expect(page).to have_text('GOALS')
    expect(page).to have_text('ACTIONS')

    %w[Self Team ODT Client].each do |section|
      expect(page).to have_text(section)
    end

    expect(page).to have_css("img[alt='Notebook collage']")
  end

  it 'navigates to root when clicking the home icon' do
    visit(brag_path)

    find("a[href='#{root_path}']").click
    expect(page).to have_current_path(root_path, ignore_query: true)
  end
end
