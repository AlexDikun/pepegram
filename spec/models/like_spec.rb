# spec/models/like_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  it { is_expected.to belong_to :account }
  it { is_expected.to belong_to :post }

  it { is_expected.to validate_presence_of(:account_id) }
  it { is_expected.to validate_presence_of(:post_id) }
end
