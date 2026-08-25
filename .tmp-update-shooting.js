const fs = require('fs');
const path = 'shooting.html';
let text = fs.readFileSync(path, 'utf8');
text = text.replace('.logo img{width:120px;height:48px;object-fit:contain}', '.logo img{width:145px;height:58px;object-fit:contain}');
text = text.replace('.nav .logo img{width:min(120px,100%)}', '.nav .logo img{width:min(140px,100%)}');
fs.writeFileSync(path, text, 'utf8');
