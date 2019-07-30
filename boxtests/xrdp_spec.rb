# Test ansible
describe package('xrdp') do
    it { should be_installed }
end
