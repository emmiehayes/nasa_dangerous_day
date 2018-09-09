require 'rails_helper'

describe 'a guest user visiting the root page' do
  scenario 'enters start date and end date & sees most dangerous day within the date range' do 

  visit '/'

  within(".inner-nav") do 
    # And I enter "2018-01-01" into the start date
    fill_in 'start_date', with: "2018-01-01"
    # And I enter "2018-01-07" into the end date
    fill_in 'end_date', with: "2018-01-07"
    # And I click "Determine Most Dangerous Day"
    click_on 'Determine Most Dangerous Day'
  end

    # Then I should be on "/most_dangerous_day"
    expect(current_path).to eq("/most_dangerous_day")
    # And I should see a heading for "Most Dangerous Day"
    expect(page).to have_content("Most Dangerous Day")
    # And I should see "January 1, 2018 - January 7, 2018"
    expect(page).to have_content("Date Range Submitted: January 1, 2018 - January 7, 2018")
    # And I should see a heading for the most dangerous day in that range "January 1, 2018"
    expect(page).to have_content("Most Dangerous Day: January 1, 2018")
    # And I should see 3 asteroids in that list
    expect(page).to have_css(".asteriods", count: 3)

    within(first(".asteriod")) do
      # And I should see "Name: (2014 KT76)"
      expect(page).to have_content("Name: (2014 KT76)")
      # And I should see "NEO Reference ID: 3672906"
      expect(page).to have_content("NEO Reference ID: 3672906")
    end

    within(second(".asteriod")) do
      # And I should see "Name: (2001 LD)"
      expect(page).to have_content("Name: (2001 LD)")
      # And I should see "NEO Reference ID: 3078262"
      expect(page).to have_content("NEO Reference ID: 3078262")
    end

    within(third(".asteriod")) do
      # And I should see "Name: (2017 YR1)"
      expect(page).to have_content("Name: (2017 YR1)")
      # And I should see "NEO Reference ID: 3794979"
      expect(page).to have_content("NEO Reference ID: 3794979")    
    end 
  end
end 