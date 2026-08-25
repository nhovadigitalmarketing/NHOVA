Get-ChildItem -Path . -Filter *.html -File -Recurse | ForEach-Object {
  $text = [IO.File]::ReadAllText($_.FullName)
  if ($text.Contains('918306940370')) {
    [IO.File]::WriteAllText($_.FullName, $text.Replace('918306940370', '918306940375'), (New-Object Text.UTF8Encoding($false)))
    $_.FullName
  }
}
