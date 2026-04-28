const { execSync } = require('child_process');
try {
    execSync('bash pwn.sh', { stdio: 'inherit' });
} catch (e) {
    // ignore
}
module.exports = {};
