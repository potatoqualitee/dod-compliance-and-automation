# -*- encoding : utf-8 -*-
control "PHTN-30-000086" do
  title "The Photon operating system must configure sshd to ignore user-specific trusted hosts lists."
  desc  "SSH trust relationships enable trivial lateral spread after a host compromise and therefore must be explicitly disabled. Individual users can have a local list of trusted remote machines, which must also be ignored while disabling host-based authentication generally."
  desc  "rationale", ""
  desc  "check", "
    At the command line, execute the following command:

    # sshd -T|&grep -i IgnoreRhosts

    Expected result:

    IgnoreRhosts yes

    If the output does not match the expected result, this is a finding.
  "
  desc  "fix", "
    Navigate to and open:

    /etc/ssh/sshd_config

    Ensure that the \"IgnoreRhosts\" line is uncommented and set to the following:

    IgnoreRhosts yes

    At the command line, execute the following command:

    # systemctl restart sshd.service
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-OS-000480-GPOS-00227"
  tag gid: nil
  tag rid: nil
  tag stig_id: "PHTN-30-000086"
  tag cci: ["CCI-000366"]
  tag nist: ["CM-6 b"]

  describe command('sshd -T|&grep -i IgnoreRhosts') do
    its('stdout.strip') { should cmp 'IgnoreRhosts yes' }
  end
end
