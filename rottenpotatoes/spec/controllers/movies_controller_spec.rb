require 'rails_helper'
 describe MoviesController do
     describe "#director" do
        it "find movies with the same director" do
            @movie_id="534"
            @movie=double('random movie', :director => 'Random Director')
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            expect(@movie).to receive(:list_movies_with_simliar_director)
            get :director, {:id => @movie_id}
            expect(response).to render_template(:director)
        end
        it "should redirect index page" do
            @movie_id="1234"
            @movie=double('random movie').as_null_object
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            get :director, {:id => @movie_id}
            expect(response).to redirect_to(movies_path)
        end
    end
    describe "#create" do
        it "Should update database" do
            @movie_id = "234"
            @movie = double("random movie", :title => "random")
            @params = {:title => "random",:rating => "R", :director => "random"}
            expect(Movie).to receive(:create!).with(@params).and_return(@movie)
            get :create, {:id => @movie_id, :movie => @params }
            expect(response).to redirect_to(movies_path)
            
        end
    end
    describe "#update" do
        it "Should update movie params" do
            @movie_id = "123"
            @movie = double("Movie",:title => "random")
            @params = {:title => "random",:rating => "R", :director => "random"}
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            expect(@movie).to receive(:update_attributes!).and_return(nil)
            get :update, {:id => @movie_id, :movie => @params}
            expect(response).to redirect_to(movie_path(@movie))
        end
    end
end