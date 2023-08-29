Get-ChildItem "C:\Users\Flynn\Pictures\Screenshots" -Filter "*.png" | Sort-Object LastWriteTime -Descending | Select-Object -First 1 { tesseract $_.FullName stdout | Set-Clipboard }
