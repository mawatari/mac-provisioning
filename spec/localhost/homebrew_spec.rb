require 'spec_helper'

homebrew_packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

homebrew_cask_packages.each do |package|
  describe file(homebrew_caskroom + '/' + package) do
    it { should be_directory }
  end
end
