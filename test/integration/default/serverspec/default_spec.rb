require 'serverspec'

set :backend, :exec

describe group('telegraf') do
  it { is_expected.to exist }
end

describe user('telegraf') do
  it { is_expected.to exist }
  it { is_expected.to belong_to_group 'telegraf' }
end

describe package('telegraf') do
  it { should be_installed }
end

# describe service('telegraf') do
#   it { is_expected.to be_running }
# end

# describe port(8094) do
#   it { is_expected.to be_listening.with('tcp') }
# end