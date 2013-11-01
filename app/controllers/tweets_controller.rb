class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all

    query = params[:m]

    request = Typhoeus.get(
    "https://api.twitter.com/1/",
    params: {s: query}
    )

    results = JSON.parse(request.body)["Search"]


    Twitter.user("@user")
    Twitter.user([:id])

    if !results && !params[:m]
        @message = "no search"
    elsif !results
        @message = "bad search"
    else
        results.each do |movie|
            rating = Movie.find_by_imdbid movie["imdbID"]
            if rating
                movie["rating"] = "#{rating.rating}"
            else
                movie["rating"] = "(none)"
            end
        end

        @results = results.sort { |x, y| y["rating"] <=> x["rating"] }
    end

    # if @results["Search"] == nil
    #   erb :error
    # else erb :search_results
    # end

  end

  def show
  end

  def edit
  end

  def new
  end
end
