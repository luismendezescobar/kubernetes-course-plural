
terraform {
    required_providers {
        google = {      
            version = "~> 3.23.0"
        }
    }
}


module "network" {
  source = "./modules/network"
  project_id    = var.project_id
  vpc_name      = var.vpc_name
  subnet_name   = var.subnet_name
  ip_cidr_range = var.ip_cidr_range
  region        = var.region 
  computer_account=var.computer_account 
}



locals {
  instances_to_build = { for server in var.server_vm_info : server.name => server }
}




module "vm_instances_creation" {
  for_each                  = local.instances_to_build

  source                    = "./modules/create-vm"  
  project_id                = var.project_id  
  zone                      = each.value.zone
  instance_name             = each.value.name
  static_internal_ip        = each.value.static_internal_ip
  external_ip               = each.value.external_ip
  instance_description      = each.value.description
  instance_tags             = each.value.instance_tags
  instance_machine_type     = each.value.instance_type
  source_image              = each.value.source_image
  subnetwork_project        = var.project_id
  subnetwork                = var.subnet_name
  init_script               = each.value.init_script
  auto_delete               = each.value.auto_delete
  disk_size_gb              = each.value.boot_disk_size_gb
  boot_disk_type            = each.value.boot_disk_type
  additional_disks          = each.value.additional_disks

  depends_on = [module.network]
}
