$rupee = [string][char]8377
$updates = @{
  'brand-logo.html' = @("${rupee}500", "${rupee}500", "${rupee}500")
  'brand-card.html' = @("${rupee}350", "${rupee}350", "${rupee}350")
  'poster.html' = @("${rupee}500", "${rupee}500", "${rupee}500")
  'portfolio-design.html' = @("${rupee}2,500", "${rupee}2,500", "${rupee}2,500")
  'catalogue-design.html' = @("${rupee}2,500", "${rupee}2,500", "${rupee}2,500")
  'portfolio-photo.html' = @("${rupee}3,000", "${rupee}3,000", "${rupee}3,000")
  'portfolio-video.html' = @("${rupee}5,500", "${rupee}5,500", "${rupee}5,500")
  'voice-call.html' = @('CONTACT', 'CONTACT', 'CONTACT')
  'social-media.html' = @("${rupee}9,999", "${rupee}14,999", "${rupee}24,999")
}
$placeholders = @{
  'brand-logo.html' = 'LOGO PRICE'; 'brand-card.html' = 'CARD PRICE'; 'poster.html' = 'POSTER PRICE';
  'portfolio-design.html' = 'EDIT PRICE'; 'catalogue-design.html' = 'CATALOGUE PRICE';
  'portfolio-photo.html' = 'PHOTO PRICE'; 'portfolio-video.html' = 'VIDEO PRICE';
  'voice-call.html' = 'EDIT PRICE'; 'social-media.html' = 'EDIT PRICE'
}
foreach ($file in $updates.Keys) {
  $html = [IO.File]::ReadAllText($file)
  foreach ($value in $updates[$file]) {
    $old = '<div class="price">' + $placeholders[$file] + '</div>'
    if (-not $html.Contains($old)) { throw "Missing pricing placeholder in $file" }
    $html = $html.Replace($old, '<div class="price">' + $value + '</div>', 1)
  }
  [IO.File]::WriteAllText($file, $html, (New-Object Text.UTF8Encoding($false)))
}