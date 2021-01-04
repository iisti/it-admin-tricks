## Filter one username from Event viewer
* Use XML filter. You can check the syntax from one of the results -> Details -> XML view.

      # This one works with AD user and local user
      <QueryList>
        <Query Id="0" Path="Security">
          <Select Path="Security">
            *[EventData[Data[@Name='TargetUserName']='user.name']]
          </Select>
        </Query>
      </QueryList>
      
      
      # For auditing Logons from domain. Checks EventID 4624, Domain and LogonType 10=RDP
      # More of LogonTypes https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventID=4624
      <QueryList>
        <Query Id="0" Path="Security">
          <Select Path="Security">
            *[
            System[(EventID='4624')]
            and
            EventData[Data[@Name='TargetDomainName']='DOMAIN']
            and
            EventData[Data[@Name='LogonType']='10']
            ]
          </Select>
        </Query>
      </QueryList>

## Get all account informations from AD via Powershell
* How to get all accounts in AD via PowerShell
  * https://www.deliveron.com/blog/query-user-accounts-active-directory-powershell/
* How to get AD user login history via PowerShell
  * https://social.technet.microsoft.com/wiki/contents/articles/51413.active-directory-how-to-get-user-login-history-using-powershell.aspx

* On AD VM **open Powershell as Administrator**:

      Import-module ActiveDirectory
      PS C:\Users\sysop> Get-ADUser -Filter {Surname -eq "Somelastname"} -SearchBase "OU=myorg,DC=mydomain,DC=com" -Properties mail,Name,ObjectClass,Enabled |
        Select mail,Name,ObjectClass,Enabled

      mail                                      Name                        ObjectClass Enabled
      ----                                      ----                        ----------- -------
      somefirstname.somelastname@mydomain.com Somefirstname Somelastname  user           True


* Get more information with a script
  * Open Windows PowerShell ISE as an administrator

        PS C:\Windows\system32> Import-module ActiveDirectory


        #### Script for checking info of 1 user ####
        # Edit the user base
        $search_base = "OU=myorg,DC=mydomain,DC=com"
        
        $date = Get-Date -Format "dd.MM.yyyy"
        $user = Read-Host -Prompt 'Input sAMAccountName'

        # Print the user. properties variable is used, so that the command doesn't grow long.
        $properties = 'mail,Name,sAMAccountName,ObjectClass,Enabled,LastLogonTimestamp,LastLogonDate,description' -split ','
        Get-ADUser -Filter {sAMAccountName -eq $user} -SearchBase $search_base -Properties $properties |
          Select $properties

  * Script output
   
        Input sAMAccountName: somefirstname.somelastname


        mail               : somefirstname.somelastname@mydomain.com
        Name               : Somefirstname Somelastname
        sAMAccountName     : somefirstname.somelastname
        ObjectClass        : user
        Enabled            : True
        LastLogonTimestamp : 132433328056832574
        LastLogonDate      : 31.08.2020 09:33:25
        description        :  

  * Comparing LastLogonTimestamp to LastLogonDate
  
        PS C:\Windows\system32> w32tm /ntte 132433328056832574
        153279 07:33:25.6832574 - 31.08.2020 09:33:25 

### Export all users:

    # User base
    $search_base = "OU=myorg,DC=mydomain,DC=com"
    
    $date = Get-Date -Format "yyyy-MM-dd"

    # Properties variable is used, so that the command doesn't grow long.
    # LastLogonTimestamp is good to have for easy sorting in Office sheet program.
    $properties = 'mail,Name,sAMAccountName,ObjectClass,Enabled,LastLogonTimestamp,LastLogonDate,description' -split ','
    
    Get-ADUser -Filter * -SearchBase $search_base -Properties $properties |
      Select $properties |
      Export-CSV "ad-accounts-$date.csv"
