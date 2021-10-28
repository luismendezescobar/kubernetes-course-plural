project_id="playground-s-11-ebb94c99"  #update the project here
vpc_name="kubernetes-vpc"
region="us-east1"
subnet_name="kubernetes-us-east1"
ip_cidr_range="172.16.94.0/24"
computer_account="508510210068-compute@developer.gserviceaccount.com" #update the computer account here


server_vm_info = [
  {
    zone              = "us-east1-a"
    name              = "c1-cp1"
    static_internal_ip="172.16.94.10"
    instance_type     = "e2-small"
    source_image      = "ubuntu-os-cloud/ubuntu-1804-lts"
    boot_disk_size_gb = 100
    boot_disk_type    = "pd-standard" 
    auto_delete       = true
    description       = "kubernetes control plane"
    init_script       = ""  
    instance_tags = []
    additional_disks = []
  },
  {
    zone              = "us-east1-a"
    name              = "c1-node1"
    static_internal_ip= "172.16.94.11"
    instance_type     = "e2-small"
    source_image      = "ubuntu-os-cloud/ubuntu-1804-lts"
    boot_disk_size_gb = 100
    boot_disk_type    = "pd-standard" 
    auto_delete       = true
    description       = "kubernetes control plane"
    init_script       = ""  
    instance_tags = []
    additional_disks = []
  },
  {
    zone              = "us-east1-a"
    name              = "c1-node2"
    static_internal_ip= "172.16.94.12"
    instance_type     = "e2-small"
    source_image      = "ubuntu-os-cloud/ubuntu-1804-lts"
    boot_disk_size_gb = 100
    boot_disk_type    = "pd-standard" 
    auto_delete       = true
    description       = "kubernetes control plane"
    init_script       = ""  
    instance_tags = []
    additional_disks = []
  },
  {
    zone              = "northamerica-northeast1-a"
    name              = "us-east1-a"
    static_internal_ip="172.16.94.13"
    instance_type     = "e2-small"
    source_image      = "ubuntu-os-cloud/ubuntu-1804-lts"
    boot_disk_size_gb = 100
    boot_disk_type    = "pd-standard" 
    auto_delete       = true
    description       = "kubernetes control plane"
    init_script       = ""  
    instance_tags = []
    additional_disks = []
  }
]