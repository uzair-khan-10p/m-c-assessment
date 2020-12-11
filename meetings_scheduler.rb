# This class will schedule your meetings in a 9-5 working hours
class MeetingsScheduler
  attr_reader :onsite_meetings, :offsite_meetings

  HOURS_SPAN = 8

  def initialize(meetings)
    raise 'Invalid argument structure.' unless meetings.is_a? Array

    @onsite_meetings = meetings.select { |m| m[:type] == :onsite }
    @offsite_meetings = meetings.select { |m| m[:type] == :offsite }
  end

  def schedule
    unless can_fit?
      puts 'No, can’t fit.'
      return
    end

    scheduled_meetings = []
  end

  def can_fit?
    total_hours = 0
    onsite_meetings.each { |m| total_hours += m[:duration] }
    offsite_meetings.each { |m| total_hours += m[:duration] + 0.5 }

    total_hours <= HOURS_SPAN
  end
end
