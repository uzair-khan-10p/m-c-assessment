require './meetings_scheduler'

RSpec.describe MeetingsScheduler do
  let(:example_0) do
    [
      { name: 'Meeting 1', duration: 3, type: :onsite },
      { name: 'Meeting 2', duration: 2, type: :offsite },
      { name: 'Meeting 3', duration: 1, type: :offsite },
      { name: 'Meeting 4', duration: 0.5, type: :onsite }
    ]
  end

  let(:example_1) do
    [
      { name: 'Meeting 1', duration: 1.5, type: :onsite },
      { name: 'Meeting 2', duration: 2, type: :offsite },
      { name: 'Meeting 3', duration: 1, type: :onsite },
      { name: 'Meeting 4', duration: 1, type: :offsite },
      { name: 'Meeting 5', duration: 1, type: :offsite },
    ]
  end

  let(:example_2) do
    [
      { name: 'Meeting 1', duration: 4, type: :offsite },
      { name: 'Meeting 2', duration: 4, type: :offsite }
    ]
  end

  let(:example_3) do
    [
      { name: 'Meeting 1', duration: 0.5, type: :offsite },
      { name: 'Meeting 2', duration: 0.5, type: :onsite },
      { name: 'Meeting 3', duration: 2.5, type: :offsite },
      { name: 'Meeting 4', duration: 3, type: :onsite }
    ]
  end

  let(:example_4) do
    [
      { name: 'Meeting 1', duration: 4, type: :offsite },
      { name: 'Meeting 2', duration: 3.5, type: :offsite }
    ]
  end

  let(:example_5) do
    [
      { name: 'Meeting 1', duration: 8, type: :offsite }
    ]
  end

  it 'raises error on invalid argument' do
    expect { described_class.new(123) }.to raise_error 'Invalid argument structure.'
  end

  describe '#can_fit?' do
    it 'returns false for fitting example_2' do
      scheduler = described_class.new(example_2)
      expect(scheduler.can_fit?).to be_falsey
    end
  end

  describe "#schedule" do
    context 'cannot fit the meetings' do
      it 'with example_2' do
        scheduler = described_class.new(example_2)
        scheduler.schedule
        expect(scheduler.scheduled_meetings.length).to eq(0)
        expect(scheduler.label).to eq 'No, can’t fit.'
      end
    end

    context 'can fit the meetings' do
      it 'with example_0' do
        scheduler = described_class.new(example_0)
        expect(scheduler.scheduled_meetings.length).to eq(0)
        scheduler.schedule
        expect(scheduler.scheduled_meetings.length).to eq(4)
        expect(scheduler.label).to eq 'Yes, can fit. One possible solution would be:'
      end

      it 'in order with example_1' do
        scheduler = described_class.new(example_1)
        scheduler.schedule

        expect(scheduler.scheduled_meetings[0]).to eq ' 9:00 AM - 10:30 AM - Meeting 1'
        expect(scheduler.scheduled_meetings[1]).to eq '10:30 AM - 11:30 AM - Meeting 3'
        expect(scheduler.scheduled_meetings[2]).to eq '12:00 PM -  2:00 PM - Meeting 2'
        expect(scheduler.scheduled_meetings[3]).to eq ' 2:30 PM -  3:30 PM - Meeting 4'
        expect(scheduler.scheduled_meetings[4]).to eq ' 4:00 PM -  5:00 PM - Meeting 5'
      end

      it 'in order with example_3' do
        scheduler = described_class.new(example_3)
        scheduler.schedule

        expect(scheduler.scheduled_meetings[0]).to eq ' 9:00 AM -  9:30 AM - Meeting 2'
        expect(scheduler.scheduled_meetings[1]).to eq ' 9:30 AM - 12:30 PM - Meeting 4'
        expect(scheduler.scheduled_meetings[2]).to eq ' 1:00 PM -  1:30 PM - Meeting 1'
        expect(scheduler.scheduled_meetings[3]).to eq ' 2:00 PM -  4:30 PM - Meeting 3'
      end

      it 'in order with example_4' do
        scheduler = described_class.new(example_4)
        scheduler.schedule

        expect(scheduler.scheduled_meetings[0]).to eq ' 9:00 AM -  1:00 PM - Meeting 1'
        expect(scheduler.scheduled_meetings[1]).to eq ' 1:30 PM -  5:00 PM - Meeting 2'
      end

      it 'in order with example_5' do
        scheduler = described_class.new(example_5)
        scheduler.schedule

        expect(scheduler.scheduled_meetings[0]).to eq ' 9:00 AM -  5:00 PM - Meeting 1'
      end
    end
  end
end
