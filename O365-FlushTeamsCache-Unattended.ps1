# Code to flush Teams client cache
# Kill Teams processes
Get-Process -ProcessName Teams | Stop-Process -Force
# Wait before continuing with cleanup
Start-Sleep -Seconds 3
# Flush Teams client caches
Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\Application Cache\Cache" | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\blob_storage" | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\databases" | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\Cache" | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\GPUCache" | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\IndexedDB" | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\Local Storage" | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:APPDATA\"Microsoft\Teams\tmp" | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
# All done, start Teams
Start-Process -FilePath $env:LOCALAPPDATA\Microsoft\Teams\current\Teams.exe
# End of Script