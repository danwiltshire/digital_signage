require 'spec_helper'
describe 'digital_signage' do
  context 'with default values for all parameters' do
    it { should contain_class('digital_signage') }
  end
end
