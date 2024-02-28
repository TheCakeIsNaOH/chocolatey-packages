$ErrorActionPreference = 'Stop'

remove-item "$ENV:Public\Desktop\GPU-Z.lnk" -Force -ErrorAction SilentlyContinue
remove-item "$ENV:ProgramData\Microsoft\Windows\Start Menu\Programs\GPU-Z.lnk" -Force -ErrorAction SilentlyContinue
