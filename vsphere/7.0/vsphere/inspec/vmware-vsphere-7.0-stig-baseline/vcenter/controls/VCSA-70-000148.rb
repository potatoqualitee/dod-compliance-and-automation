control 'VCSA-70-000148' do
  title 'The vCenter Server must be configured to send logs to a central log server.'
  desc  'vCenter must be configured to send near realtime log data to syslog collectors so that that information wil be available to investigators in the case of a security incident or to assist in troubleshooting.'
  desc  'rationale', ''
  desc  'check', "
    Open the Virtual Appliance Management Interface (VAMI) by navigating to https://<vCenter server>:5480.

    Log in with local OS administrative credentials or with an SSO account that is a member of the \"SystemConfiguration.BashShellAdministrator\" group.

    Select \"Syslog\" on the left navigation pane.

    On the resulting pane on the right, ensure that at least one site-specific syslog receiver is configured and is listed as \"Reachable\".

    If there is no valid syslog collector configured or if the collector is not listed as \"Reachable\", this is a finding.
  "
  desc 'fix', "
    Open the Virtual Appliance Management Interface (VAMI) by navigating to https://<vCenter server>:5480.

    Log in with local OS administrative credentials or with an SSO account that is a member of the \"SystemConfiguration.BashShellAdministrator\" group.

    Select \"Syslog\" on the left navigation pane.

    On the resulting pane on the right, click \"Edit\" or \"Configure\".

    Edit or add the address and port of a site-specific syslog aggregator or SIEM with the apprioriate protocol.

    UDP is discouraged due to it's stateless and unencrypted nature. TLS is preferred. Click \"Save\".
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000358'
  tag gid: nil
  tag rid: nil
  tag stig_id: 'VCSA-70-000148'
  tag cci: ['CCI-001851']
  tag nist: ['AU-4 (1)']

  describe 'This check is a manual or policy based check' do
    skip 'This must be reviewed manually'
  end
end
