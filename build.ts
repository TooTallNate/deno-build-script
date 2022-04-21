await Deno.mkdir('.vercel/output/static', { recursive: true });
await Deno.writeTextFile(
  '.vercel/output/config.json',
  JSON.stringify({ version: 3 })
);
await Deno.writeTextFile(
  '.vercel/output/static/index.txt',
  'Hello World, from a Deno build script!'
);
