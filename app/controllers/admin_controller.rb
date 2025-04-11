class AdminController < ApplicationController
    def index
        @total_posts = Post.count
    end
end
