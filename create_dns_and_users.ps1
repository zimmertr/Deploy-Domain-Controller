#############################################################################################################
#######################################create_dns_and_users##################################################
#############################################################################################################
### This script will:                                                                                     ###
###  - Provision a reverse DNS lookup zone for each specified subnet                                      ###
###  - Create dns entries                                                                                 ###
###  - Create new users                                                                                   ###
###  - Create new groups                                                                                  ###
###  - Add users to common groups                                                                         ###
#############################################################################################################
#############################################################################################################

#################################
#Create Reverse DNS Lookup Zones#
#################################
Add-DnsServerPrimaryZone -DynamicUpdate NonsecureAndSecure -NetworkId ">SUBNET<" -ReplicationScope "Forest" -ErrorAction Ignore


#Pause to complete adding zones.
Start-Sleep -s 5

#################################
########Adding DNS Records#######
#################################
Add-DnsServerResourceRecordA -CreatePtr -Zonename "" -IPv4Address "" -Name ""


#################################
##Add developer user accounts####
#################################
#Set up default password
$rawPass=""
$Pass= $rawPass | ConvertTo-SecureString -AsPlainText -Force

#Create user accounts
New-ADUser -Name "" -UserPrincipalname ""@"" -AccountPassword $Pass -GivenName "" -Surname "" -Enabled $true

#Create AD Group for new Users
New-ADGroup -Description "AD Users" -DisplayName "AD Users" -Name "AD Users" -GroupScope DomainLocal

#Add to AD Groups
Add-ADGroupMember -Identity "Remote Desktop Users" -Members ""
Add-ADGroupMember -Identity "Administrators" -Members ""
Add-ADGroupMember -Identity "AD Users" -Members ""
