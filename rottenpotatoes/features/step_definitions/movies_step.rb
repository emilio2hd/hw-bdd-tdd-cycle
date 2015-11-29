Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
    expect(page).to have_text("Details about #{movie}")
    expect(page).to have_text("Director: #{director}")
end