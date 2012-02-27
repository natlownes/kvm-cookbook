maintainer       "Nat Lownes"
maintainer_email "nat.lownes@gmail.com"
name             "kvm"
license          "Apache 2.0"
description      "Installs/Configures kvm-cookbook"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
depends          "apt"

distros = %w(debian ubuntu)

distros.each do |dist|
  supports dist
end
