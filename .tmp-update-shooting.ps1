$path = 'shooting.html'
$text = [IO.File]::ReadAllText($path)
$text = $text.Replace('.logo img{width:120px;height:48px;object-fit:contain}', '.logo img{width:145px;height:58px;object-fit:contain}')
$text = $text.Replace('.nav .logo img{width:min(120px,100%)}', '.nav .logo img{width:min(140px,100%)}')
[IO.File]::WriteAllText($path, $text, (New-Object Text.UTF8Encoding($false)))
