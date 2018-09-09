require 'rails_helper'

describe 'a guest user visiting the root page' do
  scenario 'enters start date and end date & sees most dangerous day within the date range' do 

  visit '/'

  within(".inner-nav") do 
    # And I enter "2018-01-01" into the start date
    fill_in 'start_date', with: "2018-09-08"
    # And I enter "2018-01-07" into the end date
    fill_in 'end_date', with: "2018-09-14"
    # And I click "Determine Most Dangerous Day"
    click_on 'Determine Most Dangerous Day'
  end

    # Then I should be on "/most_dangerous_day"
    expect(current_path).to eq("/most_dangerous_day")
    # And I should see a heading for "Most Dangerous Day"
    expect(page).to have_content("Most Dangerous Day")
    # And I should see "January 1, 2018 - January 7, 2018"
    expect(page).to have_content("Date Range Submitted: September 8, 2018 - September 14, 2018")
    # And I should see a heading for the most dangerous day in that range "January 1, 2018"
    expect(page).to have_content("Most Dangerous Day: September 11, 2018")
    # And I should see 3 asteroids in that list
    expect(page).to have_css(".asteroid", count: 3)

    within(first(".asteroid")) do
      # And I should see "Name: (2008 KZ5)"
      expect(page).to have_content("Name: (2008 KZ5)")
      # And I should see "NEO Reference ID: 3412889"
      expect(page).to have_content("NEO Reference ID: 3412889")
    end
  
    # And I should see "Name:  350872 (2002 PG43)"
    expect(page).to have_content("Name: 350872 (2002 PG43)")
    # And I should see "NEO Reference ID: 3566605"
    expect(page).to have_content("NEO Reference ID: 3566605")


    # And I should see "Name:  350872 (2002 PG43)"
    expect(page).to have_content("Name: 350872 (2002 PG43)")
    # And I should see "NEO Reference ID: 3566605"
    expect(page).to have_content("NEO Reference ID: 3566605")
  end
end 
