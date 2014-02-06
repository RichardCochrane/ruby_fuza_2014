class Alarm < ActiveRecord::Base

  def activate_now
    [active?, right_time, right_day, !activated?, phone_awake_and_ready].any? ? true : false
  end

  def activate_alarm
    binding.pry

    alarm_settings = {
      description: description,
      allow_snooze: allow_snooze,
      volume: alarm_volume,
      vibrate: vibrate}

    if maths_to_dismiss?
      alarm_settings = alarm_settings.merge(maths_question)
    end

    if !repeat?
      self.activated = true
      save
    end
  end

  def maths_question
    first_number = rand(1000) + 1000
    second_number = random(100)

    @correct_answer = (first_number - second_number ) * 2
    @question = "(#{first_number} - #{second_number}) x 2"

    {question: @question, answer: @correct_answer}
  end

  private
  def right_time
    alarm_time = Time.parse(time)
    Time.now.to_i == Time.parse(alarm_time).to_i
  end

  def right_day
    # For reference, both this app and default Ruby will consider Monday
    # the first day of the week, starting at 0, 1 for Tuesday, etc.
    current_day_of_week = Date.today.days_to_week_start

    alarm_days = repeat_days.split(',').map { |dow| dow.to_i }
    alarm_days.include? current_day_of_week
  end

  def phone_awake_and_ready
    # TODO: Determine whether the phone is in silent mode
    return true
  end
end
