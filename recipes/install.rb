execute "apt-get-update" do
  notifies :run, resources(:execute => "apt-get-update"), :immediately
end

execute "apt-get-dist-upgrade" do
  command "apt-get dist-upgrade"
end

packages = %w(qemu-kvm libvirt-bin bridge-utils screen console-data console-tools debconf)

packages.each do |pkg|
  package pkg do
    action :install
  end
end

execute "add root to libvirt group" do
  command "adduser `id -un` libvirt"
end

execute "set swappiness=0" do
  command %{"vm.swappiness=0" >> /etc/sysctl.conf}
end

