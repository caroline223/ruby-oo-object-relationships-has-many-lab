class Author

    attr_accessor :name, :posts 
    
    
    @@post_count = 0

    @@all = []

    def initialize(name)
        @name = name
        @posts = []
        @@post_count += 1
        @@all << self 
    end

    def posts
        Post.all.select do |post|
            post.author == self 
        end 
    end

    def add_post(post)
        @posts << post
        post.author = self
    end

    def add_post_by_title(title)
        post = Post.new(title)
        @posts << post
        post.author = self 
    end 

    def self.all
        @@all 
    end

    def self.post_count
       new_array = Author.all.collect do |author|
            author.posts.length
       end
       new_array.sum 
    end

end