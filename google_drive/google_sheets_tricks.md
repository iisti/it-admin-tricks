# Tricks for Google Sheets
* Split text to columns when pasting
  * https://webapps.stackexchange.com/a/130618
* How to trim domain part from email address

      # In Sheet C3 is an email address or it can be empty
      =IF(not(isblank(C2)),RIGHT(C:C, LEN(C:C)-FIND("@",C:C,1)),"")
      
  | Username | Some info | Email | Email domain |
  |----------|-----------|-------|--------------|
  |user|info|user@domain.com|domain.com|
  |user2|info2|||
