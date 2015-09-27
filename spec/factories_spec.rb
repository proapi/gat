require 'rails_helper'

describe "Factories", :factories do
  FactoryGirl.factories.map(&:name).each do |factory_name|
    it "#{factory_name} is valid" do
      instance = FactoryGirl.build(factory_name)
      expect(instance.valid?).to be(true), instance.errors.full_messages.to_sentence
    end
  end
end
