require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:registered_application) { RegisteredApplication.create!(name: "New App Name", url: "www.appname.com") }

   describe "attributes" do
     it "has name and url attributes" do
       expect(registered_application).to have_attributes(name: "New App Name", url: "www.appname.com")
     end
   end
end
