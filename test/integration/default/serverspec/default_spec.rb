require 'serverspec'

set :backend, :exec

describe file('/usr/local/bin/nvim') do
  it { should be_file }
  it { should be_executable }
end
