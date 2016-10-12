Vagrant.configure("2") do |config|

  config.vm.box = 'mwrock/Windows2012R2'

  config.vm.guest = :windows
  config.vm.communicator = 'winrm'
  config.vm.boot_timeout = 600
  config.vm.graceful_halt_timeout = 600

  config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true

  config.vm.synced_folder ".", "C:/vagrant", type: "smb"
  config.vm.provision "shell", privileged: true, path: "Install-PreRequisites.ps1"

  config.vm.provider :hyperv do |h|
    h.memory = 1024
    h.ip_address_timeout = 300
    h.differencing_disk = true
  end

end
