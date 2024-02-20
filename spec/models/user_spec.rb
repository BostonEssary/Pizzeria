# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it "has an email of email1@email.com" do
    user = create(:user)

    expect(user.email).to eq("email1@email.com")
  end

  it "has a role of Manager when assigned :manager role" do
    user = create(:user)
    user.add_role :manager

    expect(user.has_role? :manager).to eq(true)
  end

  it "has a role of Chef when assigned :chef role" do
    user = create(:user)
    user.add_role :chef

    expect(user.has_role? :chef).to eq(true)
  end
end
