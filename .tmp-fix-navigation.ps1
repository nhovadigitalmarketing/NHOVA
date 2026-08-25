$files = Get-ChildItem -Filter '*.html'
$old = '<a class="back" href="index(4).html#services">BACK TO SERVICES</a>'
$new = '<a class="back" href="index(4).html#services" onclick="if (document.referrer &amp;&amp; new URL(document.referrer).origin === location.origin) { history.back(); return false; }">BACK TO SERVICES</a>'
foreach ($file in $files) {
  $html = [IO.File]::ReadAllText($file.FullName)
  if ($html.Contains($old)) {
    [IO.File]::WriteAllText($file.FullName, $html.Replace($old, $new), (New-Object Text.UTF8Encoding($false)))
  }
}