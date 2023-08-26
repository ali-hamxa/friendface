class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  validates :user_id, uniqueness: { scope: [:likeable_type, :likeable_id],
                                    message: "can only like a likeable once" }

  def self.most_liked_days_of_week
    likes_of_the_week = Hash.new(0)

    Like.group_by_day(:date).count.each do |date, like_count|
      day_name = date.strftime('%A').downcase.to_sym
      likes_of_the_week[day_name] += like_count
    end

    likes_of_the_week.sort_by { |_, likes| -likes }.to_h
  end

  def self.like_streaks
    dates_with_likes_counts = Like.group_by_day(:date).count.select { |_, likes| likes > 0 }

    streaks = []
    streakcount = 0
    streakdays = []

    dates_with_likes_counts.each_cons(2) do |(prev_date, prev_likes), (curr_date, curr_likes)|
      if curr_likes > prev_likes
        streakdays << prev_date if streakcount.zero?
        streakdays << curr_date
        streakcount += 1
      else
        streaks << { streakcount: streakcount + 1, dates: streakdays } unless streakcount.zero?
        streakcount = 0
        streakdays = []
      end
    end

    streaks << { streakcount: streakcount + 1, dates: streakdays } unless streakcount.zero?

    streaks.sort_by { |streak| -streak[:streakcount] }
  end
end
