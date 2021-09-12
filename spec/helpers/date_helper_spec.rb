# frozen_string_literal: true

require "rails_helper"

RSpec.describe DateHelper, type: :helper do
  describe "#formatted_date" do
    it "returns a date with the format 1 Jan 2020" do
      result = formatted_date(Date.new(2020, 1, 1))
      expect(result).to eq "1 Jan 2020"
    end
  end
end
