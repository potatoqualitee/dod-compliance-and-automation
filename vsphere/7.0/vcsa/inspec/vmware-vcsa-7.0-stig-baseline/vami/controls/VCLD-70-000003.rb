control 'VCLD-70-000003' do
  title 'VAMI must use cryptography to protect the integrity of remote sessions.'
  desc  "
    Data exchanged between the user and the web server can range from static display data to credentials used to log in the hosted application. Even when data appears to be static, the non-displayed logic in a web page may expose business logic or trusted system relationships. The integrity of all the data being exchanged between the user and web server must always be trusted. To protect the integrity and trust, encryption methods should be used to protect the complete communication session.

    To order to protect the integrity and confidentiality of the remote sessions, VAMI uses SSL/TLS.
  "
  desc  'rationale', ''
  desc  'check', "
    At the command prompt, execute the following command:

    # /opt/vmware/sbin/vami-lighttpd -p -f /opt/vmware/etc/lighttpd/lighttpd.conf 2>/dev/null|grep \"ssl.engine\"|sed -e 's/^[ ]*//'

    Expected result:

    ssl.engine                 = \"enable\"

    If the output does not match the expected result, this is a finding.

    Note: The command must be run from a bash shell and not from a shell generated by the \"appliance shell\". Use the \"chsh\" command to change the shell for your account to \"/bin/bash\". See KB Article 2100508 for more details.
  "
  desc 'fix', "
    Navigate to and open:

    /opt/vmware/etc/lighttpd/lighttpd.conf

    Add or reconfigure the following value:

    ssl.engine = \"enable\"

    Restart the service with the following command:

    # vmon-cli --restart applmgmt
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000015-WSR-000014'
  tag satisfies: ['SRG-APP-000172-WSR-000104', 'SRG-APP-000315-WSR-000003', 'SRG-APP-000439-WSR-000151', 'SRG-APP-000439-WSR-000152']
  tag gid: nil
  tag rid: nil
  tag stig_id: 'VCLD-70-000003'
  tag cci: ['CCI-001453', 'CCI-000197', 'CCI-002314', 'CCI-002418', 'CCI-002418']
  tag nist: ['AC-17 (2)', 'IA-5 (1) (c)', 'AC-17 (1)', 'SC-8', 'SC-8']

  runtime = command("#{input('lighttpdBin')} -p -f #{input('lighttpdConf')}").stdout

  describe parse_config(runtime).params['ssl.engine'] do
    it { should cmp '"enable"' }
  end
end
