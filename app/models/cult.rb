class Cult
    @@all = []
    attr_reader :name, :location
    def initialize(name, location, founding_year, slogon)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogon = slogon

        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        all.find do |cult|
            cult.name == name
        end
    end

    def self.find_by_location(location)
        all.find do |cult|
            cult.location == location
        end
    end

    def self.founding_year(founding_year)
        all.find do |cult|
            cult.founding_year == founding_year
        end
    end

    def recruit_follower(follower)
        BloodOath.new(Time.now, self, follower)
    end

    def my_followers
        my_oaths = BloodOath.all.filter do |oath|
            oath.cult == self
        end

        my_oaths.map do |oath|
            oath.follower
        end

    end

    def cult_population
        my_followers.length
    end

    def cult_by_average_age
        ages = my_followers.reduce(0) do |ages, followers|
            ages + followers.age
        end

        ages / my_followers.length.to_f
    end

    def my_followers_mottos
        my_followers.map { |follower| follower.motto }
    end

    def self.least_popular
        all.min {|cult| cult.cult_population} 
    end

    def self.most_common_location
        all.max do |cult| 
            cult.location
        end.location
    end
end