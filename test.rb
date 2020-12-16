require './meetings_scheduler'

# assuming duration in hours
example_0 = [
  { name: 'Meeting 1', duration: 3, type: :onsite },
  { name: 'Meeting 2', duration: 2, type: :offsite },
  { name: 'Meeting 3', duration: 1, type: :offsite },
  { name: 'Meeting 4', duration: 0.5, type: :onsite }
]

example_1 = [
  { name: 'Meeting 1', duration: 1.5, type: :onsite },
  { name: 'Meeting 2', duration: 2, type: :offsite },
  { name: 'Meeting 3', duration: 1, type: :onsite },
  { name: 'Meeting 4', duration: 1, type: :offsite },
  { name: 'Meeting 5', duration: 1, type: :offsite },
]

example_2 = [
  { name: 'Meeting 1', duration: 4, type: :offsite },
  { name: 'Meeting 2', duration: 4, type: :offsite }
]

example_3 = [
  { name: 'Meeting 1', duration: 0.5, type: :offsite },
  { name: 'Meeting 2', duration: 0.5, type: :onsite },
  { name: 'Meeting 3', duration: 2.5, type: :offsite },
  { name: 'Meeting 4', duration: 3, type: :onsite }
]

example_4 = [
  { name: 'Meeting 1', duration: 4, type: :offsite },
  { name: 'Meeting 2', duration: 3.5, type: :offsite }
]

example_5 = [{ name: 'Meeting 1', duration: 8, type: :offsite }]

# change the example below to test different datasets.
scheduler = MeetingsScheduler.new(example_1)
scheduler.schedule

if scheduler.scheduled_meetings.empty?
  puts 'No, can’t fit.'
else
  puts 'Yes, can fit. One possible solution would be:'
  scheduler.scheduled_meetings.each { |m| puts m  }
end
