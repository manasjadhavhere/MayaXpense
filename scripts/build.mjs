import {mkdir,copyFile,cp} from 'node:fs/promises';
await mkdir('dist',{recursive:true});
await Promise.all(['index.html','icon.svg','icon-180.png','icon-192.png','icon-512.png','manifest.webmanifest','sw.js'].map(f=>copyFile(f,`dist/${f}`)));
await cp('src','dist/src',{recursive:true});
console.log('MayaXpense built to dist/ — no dependencies, backend, or environment variables.');
