#############################################################################################################
############################################deploy_ad########################################################
#############################################################################################################
### This script is used to build a domain controller. This script will:                                   ###
###  - Install Active Directory Domain Services Add on Feature                                            ###
###  - Import the AD-Domain-Services Powershell Module                                                    ###
###  - Install a new domain forest to the domain controller and reboot.                                   ###
#############################################################################################################
#############################################################################################################

#Install Active Directory Domain Services Windows Feature.
Install-WindowsFeature AD-Domain-Services -WarningAction Ignore

#Install Active Directory Users and Computers Windows Feature
Install-WindowsFeature RSAT-ADDS-Tools -WarningAction Ignore

#Import ADDS Deployment Powershell Module.
Import-Module ADDSDeployment -WarningAction Ignore

#Install DC in a new Forest
$rawDSRMPass=""
$dsrmPass= $rawDSRMPass | ConvertTo-SecureString -AsPlainText -Force
Install-ADDSForest -DomainMode "WinThreshold" -Domainname "" -DomainNetbiosName "" -ForestMode "7" -InstallDns:$true -NoRebootOnCompletion:$false -Sysvolpath "C:\Windows\SYSVOL" -SafeModeAdministratorPassword $dsrmPass -Force -WarningAction Ignore
