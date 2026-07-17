# Optional: native Supervisor options variant

By default this add-on (`../config.yaml`) points straight at the upstream
published image and leaves all configuration to the app's own Settings page.

If you'd rather set your Firefly URL/token and AI provider key from Home
Assistant's own Configuration tab instead, swap files as follows:

```bash
cd ..
mv config.yaml config.yaml.image-direct
cp optional-native-options/config.yaml .
cp optional-native-options/build.yaml .
cp optional-native-options/Dockerfile .
cp optional-native-options/run.sh .
```

This switches the add-on from `image:`-referenced to a local build (needed
because passing Supervisor options into the container as env vars requires
`bashio`, which only exists on Home Assistant's own base images — the
upstream Alpine image doesn't have it). The build stage just copies the
already-compiled binary out of the upstream image, so there's no compiling
Go yourself.

Rebuild/restart the add-on from Supervisor after swapping. Values you set in
Firefly/AI Provider fields on the Configuration tab now flow in as env vars
on container start; the app's own Settings page will show them as
pre-populated but read-only-from-env.
