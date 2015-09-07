require 'spec_helper'

describe ProxyTo do
  it 'has a version number' do
    expect(ProxyTo::VERSION).not_to be nil
  end

  context 'with a simple proxy' do
    subject { TestObjectWithA.new }

    it { is_expected.to respond_to :foo }
    it { is_expected.to respond_to :bar }
  end

  context 'with a singleton proxy' do
    subject { TestSingleton }

    it { is_expected.to respond_to :something }
  end

  context 'with multiple proxy targets' do
    subject { TestObjectWithAAndB.new }

    it { is_expected.to respond_to :foo }
    it { is_expected.to respond_to :bar }

    it 'includes generated modules in the correct inheritance order' do
      expect(subject.foo).to be false
    end
  end

  context 'when pretending to be another object' do
    subject { PretendObject.new }

    it { is_expected.to be_a_kind_of String }
  end

  context 'with proxied methods' do
    subject { MethodsTest.new.methods(true) }

    it { is_expected.to include :foo }
    it { is_expected.to include :bar }
  end
end
