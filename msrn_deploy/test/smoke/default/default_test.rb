# # encoding: utf-8

# Inspec test for recipe msrn-deploy::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('git') do
  it { should be_installed }
end

describe file('/opt/msrn') do
  it { should be_directory }
end

describe port(35001) do
  it { should be_listening }
end

describe file('/opt/msrn/src/msrn.pl') do
  it { should exist }
end

describe command('/opt/msrn/src/msrn.pl') do
  its(:stout) { should match('All Modules Loaded Succesfully') }
end
