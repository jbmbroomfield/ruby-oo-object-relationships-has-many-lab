class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        self.name = name
        @@all << self
    end

    def songs
        Song.all.filter { |song| song.artist == self }
    end

    def add_song(song)
        song.artist = self
        song
    end

    def add_song_by_name(name)
        song = Song.new(name)
        self.add_song(song)
    end

    def self.all
        @@all
    end

    def self.song_count
        self.all.reduce(0) do |count, artist|
            count + artist.songs.length
        end
    end
end