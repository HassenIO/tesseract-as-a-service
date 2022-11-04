# Tesseract as a Service

This is a demonstration repo on how to expose Tesseract through an API.

## Building and starting the server

Build a docker image that embeds what's necessary:

```sh
make build
```

Then run a container exposing the service:

```sh
make run
```

This will start a server available through `http://localhost:5055`

## Testing

If your locally cloned the repo, you can run a test using our sample image and CURL. Just run the following bash command:

```sh
curl -X POST -F file=@data/image.png http://localhost:5055/ocr
```

You should see the following JSON output:

```json
{
	"content": "The (quick) [brown] {fox} jumps!\nOver the $43,456.78 <lazy> #90 dog\n& duck/goose, as 12.5% of E-mail\nfrom aspammer@website.com is spam.\nDer ,.schnelle\u201d braune Fuchs springt\niiber den faulen Hund. Le renard brun\n\u00abrapide\u00bb saute par-dessus le chien\nparesseux. La volpe marrone rapida\nsalta sopra il cane pigro. El zorro\nmarron rapido salta sobre el perro\nperezoso. A raposa marrom rapida\nsalta sobre o c\u00e9o preguicoso.\n\f"
}
```

You should also see the log on requesting the server in the server logs.

## Warning

This is for demonstration purpose only, don't use the code as is in production as it is not optimized for it, neither follows security standards.

