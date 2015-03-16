require 'spec_helper.rb'

# valid
describe x509_private_key('/etc/docker-tls/private/cakey.pem') do
	#it { should be_encrypted }
	# since its encrypted, we cannot continue with it.
end

describe x509_private_key('/etc/docker-tls/private/server-key.pem') do
	it { should_not be_encrypted }
	it { should be_valid }
	it { should have_matching_certificate('/etc/docker-tls/certs/server-cert.pem') }
	it { should_not have_matching_certificate('/etc/docker-tls/certs/client-cert.pem') }
end

# invalid file
describe x509_private_key('/etc/docker-tls/certindex.txt') do
	it { should_not be_encrypted }
	it { should_not be_valid }
end

# certificate, but invalid stuff TODO!


