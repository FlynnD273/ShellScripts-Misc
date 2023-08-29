param (
		[string]$inputFile,
		[Single]$trim
)

$outputFile = $inputFile -replace '\.mp4$', '_cut.mp4'

$duration = & ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $inputFile
$trimDuration = [math]::Round($duration - $trim, 2)

& ffmpeg -i $inputFile -ss 0 -t $trimDuration -c:a copy $outputFile -y
