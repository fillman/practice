require 'rubygems'
require 'rspec'
require File.expand_path('../tree.rb', __FILE__)

describe Tree do
  context 'single branch' do
    subject { Tree.new(1) }

    its(:tree_levels) { should eq([[1]]) }
  end

  context 'multiple branches' do
    subject do
      Tree.new(0,
               Tree.new(1,
                        Tree.new(5),
                        Tree.new(6,
                                 Tree.new(11),
                                 Tree.new(12))
               ),
               Tree.new(2,
                        Tree.new(3),
                        Tree.new(4,
                                 Tree.new(9),
                                 Tree.new(10))
               )
      )
    end

    its(:tree_levels) { should eq([[0], [1, 2], [5, 6, 3, 4], [11, 12, 9, 10]]) }
  end

  context 'object other that Tree instance' do
    subject { Tree.new(1, 1) }

    it { expect { subject.tree_levels }.to raise_error('Some objects are not Tree instances') }
  end
end