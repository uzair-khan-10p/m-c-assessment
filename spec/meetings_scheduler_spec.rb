require './meetings_scheduler'

RSpec.describe MeetingsScheduler do
  describe "#schedule" do
    it "can't fit the meetings" do
      example_2 = [
        { name: 'Meeting 1', duration: 4, type: :offsite },
        { name: 'Meeting 2', duration: 4, type: :offsite }
      ]

      scheduler = MeetingsScheduler.new(example_2)
      scheduler.schedule
      expect(scheduler.scheduled_meetings.length).to eq(0)
    end
  end
end
