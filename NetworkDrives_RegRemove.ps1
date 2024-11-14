# Define the registry path
$registryPath = "HKCU:\Network"
 
# Check if the registry path exists
if (Test-Path $registryPath) {
   # Get all child items (keys and values) under the registry path
   $childItems = Get-ChildItem -Path $registryPath
  
   # Remove each child item
   foreach ($item in $childItems) {
       Remove-Item -Path $item.PSPath -Recurse -Force
       Write-Host "Removed: $($item.PSPath)"
   }
} else {
   Write-Host "Registry path not found: $registryPath"
}
