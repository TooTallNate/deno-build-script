Example of using a build script written in Deno to output Vercel Build Output API v3.

To create a deployment from source code:

```bash
$ vercel deploy -b ENABLE_VC_BUILD=1
```

To create a deployment locally:

```bash
$ vercel build
# `.vercel/output` directory is created
$ vercel deploy --prebuilt
```