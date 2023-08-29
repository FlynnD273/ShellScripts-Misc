param(
	[Parameter()]
	[String]$in,
	[switch]$rotate = $false
)

if ($rotate)
{
	ffplay -f lavfi "amovie=$in, asplit [a][out1]; [a] avectorscope=size=1200x1200:swap=1:mirror=y:zoom=1:mode=lissajous_xy:scale=log:draw=line:af=200:rf=200:bf=200:gf=200 [out0]"
}
else
{
	ffplay -f lavfi "amovie=$in, asplit [a][out1]; [a] avectorscope=size=1200x1200:swap=1:mirror=y:zoom=1:mode=lissajous:scale=log:draw=line:af=200:rf=200:bf=200:gf=200 [out0]"
}
