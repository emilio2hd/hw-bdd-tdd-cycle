require 'rails_helper'

RSpec.describe Movie, type: :model do
    describe 'Search for movies by director' do
        fixtures :movies

        it 'should find movies by the same director' do
            alien = movies(:alien)

            movie_list = Movie.find_all_director_by(alien.id)

            expect(movie_list.count).to eq(2)
        end

        it 'should not find movies by different directors' do
            star_wars = movies(:star_wars)

            expect { Movie.find_all_director_by(star_wars.id) }.to raise_error(ArgumentError)
        end
    end
end
