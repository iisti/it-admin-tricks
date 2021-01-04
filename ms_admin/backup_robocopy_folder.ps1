# Variable for logging date in log file name
$ReportDate = (Get-Date).tostring("dd-MM-yyyy_hh-mm-ss")

# Robocopy /b = backup mode /e = include subdirs
Robocopy "C:\dir_to_backup" "D:\backups" /b /e /log+:"D:\backups\robocopy-logs\log_robocopy_$ReportDate.txt"

### Remove log files older than 15 days ###
$limit = (Get-Date).AddDays(-15)
$path = "D:\backups\robocopy-logs"

# Delete files older than the $limit.
Get-ChildItem -Path $path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force
