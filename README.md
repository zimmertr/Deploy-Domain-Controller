# Deploy Domain Controller

## Summary

`deploy_ad.ps1` is used to build a domain controller. This script will:
 * Install Active Directory Domain Services Add on Feature         
 * Import the AD-Domain-Services Powershell Module                 
 * Install a new domain forest to the domain controller and reboot.

`create_dns_and_users.ps1` is used to configure a domain controller. This script will:
 * Provision a reverse DNS lookup zone for each specified subnet
 * Create dns entries          
 * Create new users            
 * Create new groups           
 * Add users to common groups  
