require 'rails_helper'

RSpec.describe Movie, type: :model do
    describe 'Search for movies by director' do
        fixtures :movies

        it 'should find movies by the same director' do
            alien = movies(:alien)

            movie_list = Movie.find_all_director_by(alien.director)

            expect(movie_list.count).to eq(2)
        end

        it 'should not find movies by different directors' do

            movie_list = Movie.find_all_director_by("")
            expect(movie_list).to be_empty
        end

        after(:all) { Movie.destroy_all }
    end
end
