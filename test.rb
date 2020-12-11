require './meetings_scheduler'

# assuming duration in hours
example_1 = [
  { name: 'Meeting 1', duration: 1.5, type: :onsite },
  { name: 'Meeting 2', duration: 2, type: :offsite },
  { name: 'Meeting 3', duration: 1, type: :onsite },
  { name: 'Meeting 4', duration: 1, type: :offsite },
  { name: 'Meeting 5', duration: 1, type: :offsite },
]

scheduler = MeetingsScheduler.new(example_1)
scheduler.schedule
