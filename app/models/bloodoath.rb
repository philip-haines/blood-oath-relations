class BloodOath
    @@all = []
    attr_reader :initiation_date, :cult, :follower
    def initialize(cult, follower, initiation_date)
        @initiation_date = initiation_date
        @cult = cult
        @follower = follower

        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        all.min_by do |oath|
            oath.initiation_date
        end.follower
    end
end