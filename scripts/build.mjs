import {mkdir,copyFile,cp} from 'node:fs/promises';
await mkdir('dist',{recursive:true});
await Promise.all(['index.html','favicon.png','icon-180.png','icon-192.png','icon-512.png','manifest.webmanifest','sw.js'].map(f=>copyFile(f,`dist/${f}`)));
await cp('src','dist/src',{recursive:true});
await mkdir('dist/assets',{recursive:true});
await copyFile('assets/logo-transparent.png','dist/assets/logo-transparent.png');
console.log('MayaXpense built to dist/ — no dependencies, backend, or environment variables.');
