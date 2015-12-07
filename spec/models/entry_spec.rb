require_relative "../rails_helper"

describe Entry do
  include ActiveSupport::Testing::TimeHelpers

  let(:nowish)    { DateTime.civil(2015, 12, 7, 13) }
  let(:a_bit_ago) { DateTime.civil(2015, 12, 7, 12, 30) }

  it "can start a timer right now" do
    travel_to(nowish) do
      entry = Entry.new
      expect(entry.active_timer_start).to eq(nil)
      entry.start_timer
      expect(entry.active_timer_start).to eq(nowish)
    end

  end

  describe "stopping the timer" do

    it "explodes if there's no active timer" do
      entry = Entry.new
      expect {
        entry.stop_timer
      }.to raise_error(
        Entry::NoTimerRunning
      )
    end

    describe "if there is a timer running" do

      it "adds to the duration" do
        travel_to(nowish) do
          entry = Entry.new(duration_in_minutes: 15, active_timer_start: a_bit_ago)
          entry.stop_timer
          expect(entry.duration_in_minutes).to eq(45)
        end
      end

      it "clears the running timer" do
        travel_to(nowish) do
          entry = Entry.new(duration_in_minutes: 15, active_timer_start: a_bit_ago)
          entry.stop_timer
          expect(entry.active_timer_start).to eq(nil)
        end
      end

    end

  end

end
