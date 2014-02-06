Alarm.create([
  {
    description: 'Meeting with the boss',
    time: '10:30',
    active: true,
    repeat: false,
    repeat_days: nil,
    allow_snooze: false,
    maths_to_dismiss: false
  }, {
    description: 'Wake Up - Rise and Shine',
    time: '06:30',
    active: true,
    repeat: true,
    repeat_days: '0, 1, 2, 3, 4',
    allow_snooze: false,
    maths_to_dismiss: true
  }, {
    description: 'Ease in the Weekend',
    time: '08:00',
    active: true,
    repeat: false,
    repeat_days: '5, 6',
    allow_snooze: true,
    maths_to_dismiss: false
  }])
