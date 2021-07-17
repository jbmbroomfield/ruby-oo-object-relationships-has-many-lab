class Author
    attr_accessor :name

    @@all = []

    def initialize(name)
        self.name = name
        @@all << self
    end

    def posts
        Post.all.filter { |post| post.author == self}
    end

    def add_post(post)
        post.author = self
        post
    end

    def add_post_by_title(title)
        post = Post.new(title)
        self.add_post(post)
    end

    def self.all
        @@all
    end

    def self.post_count
        self.all.reduce(0) do |count, author|
            count + author.posts.length
        end
    end
end