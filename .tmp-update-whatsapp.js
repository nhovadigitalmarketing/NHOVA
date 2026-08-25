const fs = require('fs');
const path = require('path');
function update(directory) {
  for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
    const filePath = path.join(directory, entry.name);
    if (entry.isDirectory()) update(filePath);
    else if (entry.isFile() && filePath.toLowerCase().endsWith('.html')) {
      const text = fs.readFileSync(filePath, 'utf8');
      if (text.includes('918306940370')) {
        fs.writeFileSync(filePath, text.replaceAll('918306940370', '918306940375'), 'utf8');
        console.log(filePath);
      }
    }
  }
}
update('.');
