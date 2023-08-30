require 'rails_helper'

RSpec.describe Director, type: :model do
  describe 'relationships' do
    it { should have_many(:movies) }
  end
  
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should allow_value(true).for(:alive) }
    it { should allow_value(false).for(:alive) }
  end
  
  
end