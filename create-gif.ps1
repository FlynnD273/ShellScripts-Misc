param (
		[string]$inputFile
)

$outputFile = [System.IO.Path]::ChangeExtension($inputFile, '.gif')

& ffmpeg -i "$inputFile" -filter_complex "[0:v] split [a][b];[a] palettegen [p];[b][p] paletteuse" "$outputFile"
