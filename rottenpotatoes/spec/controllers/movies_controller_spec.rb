require 'rails_helper'

RSpec.describe MoviesController, :type => :controller do
    describe 'When search for movies by director' do
        context 'movie has a director' do
            let(:movie_id) { '1' }
            let(:director_name) { 'Ridley Scott' }
            let(:movie_list) { [double('Movie'), double('Movie')] }

            it 'should call the model method that performs director search' do
                expect(Movie).to receive(:find_all_director_by).with(movie_id)

                get :search_directors, id: movie_id
            end

            it 'should make the director search render search view' do
                expect(Movie).to receive(:find_all_director_by).with(movie_id)

                get :search_directors, id: movie_id

                expect(response).to render_template('search_directors')
            end

            it 'should make the director search results available to that template' do
                expect(Movie).to receive(:find_all_director_by).with(movie_id).and_return(movie_list)

                get :search_directors, id: movie_id

                expect(assigns(:movies)).to eq(movie_list)
            end
        end

        context 'movie does not have a director' do
            let(:movie_without_director_id) { '2' }
            let(:movie_without_director_name) { 'Alien' }
            let(:no_director_message){ "'#{movie_without_director_name}' has no director info" }

            before do
                expect(Movie).to receive(:find_all_director_by).with(movie_without_director_id).and_raise(ArgumentError, no_director_message)
                get :search_directors, id: movie_without_director_id
            end

            it 'should not make the director search render search view' do
                expect(response).not_to render_template('search_directors')
            end

            it 'should redirect to home page' do
                expect(response).to redirect_to(root_path)
            end

            it 'should has flash message' do
                expect(flash[:message]).to be_present
                expect(flash[:message]).to eq(no_director_message)
            end
        end
    end
end
