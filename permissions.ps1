 #Login to file server and identify shared drive to be reviewed.
 
 #Get existing file share permissions via this line
 get-acol -path d:\folder | format-list
 
 #Use below script to remove access to shared folder/file
 #Ensure you edit the path under $acl and set-acl -Path as well as the domain\username
 
 $acl=get-acl d:\folder
 $accessrule = New-Object system.security.AccessControl.FileSystemAccessRule("domain\username","Read",,,"Allow")
 $acl.RemoveAccessRuleAll($accessrule)
 Set-Acl -Path "d:\folder" -AclObject $acl
