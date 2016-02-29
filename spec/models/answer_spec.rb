require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question){Question.create!(title: "New Question Title", body: "New Question body", resolved: false)}
  let(:answer){Answer.create!(question: question, body: "New answer body")}

  describe "attributes" do
  	it "responds to body" do
  		expect(answer).to respond_to(:body)
  	end
  end
end
