# spec/models/post_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to(:account) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_most(100) }
  it { is_expected.to validate_presence_of(:message) }
  it { is_expected.to validate_presence_of(:image_data) }

  context 'validation image format' do
    it 'allows to set png file as an image' do
      user = create(:account)
      subject.attributes = attributes_for(:post)
      subject.account = user
      is_expected.to be_valid
    end

    it 'disallows to set png file as an image' do
      user = create(:account)
      subject.attributes = attributes_for(:post, :with_invalid_image)
      subject.account = user
      is_expected.to be_invalid
    end
  end
end
