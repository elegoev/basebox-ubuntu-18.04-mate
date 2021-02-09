# copyright: 2021, Urs Voegele

title "check xrdp"

# check xrdp service
control "xrdp-1.0" do                    # A unique ID for this control
  impact 1.0                             # The criticality, if this control fails.
  title "check if xrdp is running"       # A human-readable title
  desc "check xrdp service"
  describe service('xrdp') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end
