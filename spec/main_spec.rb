require 'spec_helper'

describe "Telegraf setup" do
  package('telegraf') do
    it { should be_installed }
  end

  describe file('/etc/telegraf/') do
    it { should be_directory }
  end

  output_plugins = ANSIBLE_VARS.fetch('telegraf_output_plugins', [])

  describe file('/etc/telegraf/telegraf.conf') do
    it { should be_file }
    output_plugins.each do |plugin|
      its(:content) { should include("[[output.#{plugin['name']}]]") }
    end
  end
end
