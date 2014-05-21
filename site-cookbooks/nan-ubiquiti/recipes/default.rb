apt_repository "ubiquiti" do
  uri "http://www.ubnt.com/downloads/unifi/distros/deb/ubuntu"
  distribution 'ubuntu'
  components ["ubiquiti"]
  keyserver "keyserver.ubuntu.com"
  key "7F0CEB10"
end

apt_repository "10gen" do
	uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
	distribution "dist"
	components ["10gen"]
  keyserver "keyserver.ubuntu.com"
  key "C0A52C50"
end

package "mongodb-org"
package "unifi"

link "/usr/lib/jvm/java-6-openjdk" do
  to "/usr/lib/jvm/java-1.6.0-openjdk-amd64"
end

