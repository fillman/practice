require 'rubygems'
require 'rspec'
require File.expand_path('../array.rb', __FILE__)

describe Array do
  subject { array }

  context 'empty' do
    let(:array) { [] }

    its(:non_duplicates) { should eq([]) }
  end

  context 'one element' do
    let(:array) { [1] }

    its(:non_duplicates) { should eq([1]) }
  end

  context 'handles numbers' do
    let(:array) { [-1, 1, 2, 3, 1, 5, -1, 2] }

    its(:non_duplicates) { should eq([-1, 1, 2, 3, 5]) }
  end

  context 'handles numbers, symbols and strings' do
    let(:array) { [1, -1, 1, 'a', :a, 'a', :a, :b] }

    its(:non_duplicates) { should eq([1, -1, 'a', :a, :b]) }
  end

  context 'handles nils' do
    # This does not remove nils, those are objects too, use compact if you need to remove them k?
    let(:array) { [nil, 1, -1, 1, 'a', :a, 'a', :a, :b, nil] }

    its(:non_duplicates) { should eq([nil, 1, -1, 'a', :a, :b]) }
  end
end