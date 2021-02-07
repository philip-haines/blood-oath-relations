class Follower
    attr_reader :name, :motto, :age
    @@all = []
    def initialize(name, age, motto)
        @name = name
        @motto = motto
        @age = age

        @@all << self
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(num)
        all.filter do |follower|
            follower.age >= num
        end
    end

    def cults
        my_oaths = BloodOath.all.filter { |oath| oath.follower == self }

        my_oaths.map {|oath| oath.cult}
    end

    def join_cult(cult) 
        BloodOath.new cult, self, " " 
    end

    def my_cults_slogas
        cults.each { |cult| p cult.slogon }
    end

    def self.most_active
        all.max {|follower| follower.cults.length}
    end

    def self.top_three
        all.sort_by { |follower| follower.cults.length}.reverse.first(3)
    end

end