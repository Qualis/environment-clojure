# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

def local_cache(box_name)
  cache_dir = File.join(File.expand_path("~/"),
                        "cache",
                        "apt",
                        box_name)
  partial_dir = File.join(cache_dir, "partial")
  FileUtils.mkdir_p(partial_dir) unless File.exists? partial_dir
  cache_dir
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
  end

  config.vm.define :clojure_vagrant0 do |clojure_vagrant0|
    clojure_vagrant0.vm.hostname = "clojure-vagrant0"
    clojure_vagrant0.vm.network :private_network, ip: "10.0.0.101"
  end

  config.vm.synced_folder local_cache(config.vm.box), "/var/cache/apt/archives/"
  config.vm.synced_folder "~/Documents/workspace", "/home/vagrant/workspace"
end
