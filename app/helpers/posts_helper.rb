require 'time'
module PostsHelper
    def time_since(posttime)
        secondsSince = (Time.now - posttime)
        case secondsSince
        when 0 .. 60
        return secondsSince.floor.to_s + " seconds"
        when 61 .. 120
        return (secondsSince.floor / 60).to_s + " minute"
        when 121 .. 3600
        return (secondsSince.floor / 60).to_s + " minutes"
        when 3601 .. 7200
        return (secondsSince.floor / 3600).to_s + " hour"
        when 7201 .. 86400
        return (secondsSince.floor / 3600).to_s + " hours"
        when 86401 .. 172800
        return (secondsSince.floor / 86400).to_s + " day"
        when 172801 .. (1.0 / 0.0)
        return (secondsSince.floor / 86400).to_s + " days"
        end
    end
end
