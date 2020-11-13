require 'pry'

class Artist

    attr_accessor :name, :songs 

    @@song_count = 0

    @@all = []
    

    def initialize(name)
        @name = name
        @songs = []
        @@all << self 
    end

    def songs
        Song.all.select do |song|
            song.artist == self 
        end
    end

    def add_song(song)
        @songs << song
        song.artist = self 
        @@song_count += 1
    end

    def add_song_by_name(name)
        song = Song.new(name)
        @songs << name
        song.artist = self 
        @@song_count += 1
       
    end

    def self.all
        @@all 
    end

    def self.song_count
       new_array = Artist.all.collect do |artist|
            artist.songs.length
       end
       new_array.sum 
    end

end