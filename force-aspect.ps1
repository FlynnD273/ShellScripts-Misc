mkdir bordered
foreach ($file in (Get-ChildItem "*.png" -File))
{& ffmpeg -i $($file.Name) -vf "scale=1080:810:force_original_aspect_ratio=decrease,pad=1080:810:(ow-iw)/2:(oh-ih)/2,setsar=1" "bordered/$($file.name)"
}
foreach ($file in (Get-ChildItem "*.jpg" -File))
{& ffmpeg -i $($file.Name) -vf "scale=1080:810:force_original_aspect_ratio=decrease,pad=1080:810:(ow-iw)/2:(oh-ih)/2,setsar=1" "bordered/$($file.name)"
}
foreach ($file in (Get-ChildItem "*.jpeg" -File))
{& ffmpeg -i $($file.Name) -vf "scale=1080:810:force_original_aspect_ratio=decrease,pad=1080:810:(ow-iw)/2:(oh-ih)/2,setsar=1" "bordered/$($file.name)"
}
