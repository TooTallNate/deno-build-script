await Deno.mkdir('.vercel/output/static', { recursive: true });

// Output the `config.json` file
const config = { version: 3, cache: ['.vercel/cache/deno/**'] };
await Deno.writeTextFile('.vercel/output/config.json', JSON.stringify(config));

// Output a static file
await Deno.writeTextFile(
  '.vercel/output/static/index.txt',
  'Hello World, from a Deno build script!'
);
