require 'spec_helper.rb'

# valid
describe x509_certificate('/etc/docker-tls/cacert.pem') do
	it { should be_certificate }
	it { should be_valid }
	its(:validity_in_days) { should be >= 10 }
	its(:keylength) { should be > 1024 }
	its(:keylength) { should eq 4096 }
	it { should have_purpose 'Any Purpose CA' }
	it { should_not have_purpose 'Time Stamp signing' }
	it { should_not have_purpose 'Nonexisting' }
	its(:subject) { should match /YourOrg/ }
	its(:subject) { should_not match /MyOrg/ }
	its(:issuer) { should match /YourOrg/ }
	its(:email) { should match /^$/ }
end

# invalid file
describe x509_certificate('/etc/docker-tls/certindex.txt') do
	it { should_not be_certificate }
	it { should_not be_valid }
	its(:subject) { should_not match /AnyOrg/ }
end

# certificate, but invalid stuff TODO!


