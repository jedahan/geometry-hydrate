# Hydrate

Reminds you to hydrate every once in a while. Run `hydrate` once you have hydrated. You can also have this wrap any bindkey command to also run hydrate by exporting `GEOMETRY_PLUGIN_HYDRATE_BINDKEY`

![](hydrate.png)

## Installation

```sh
GEOMETRY_PROMPT_PLUGINS+=(hydrate)
```

## Configuration

```sh
GEOMETRY_PLUGIN_HYDRATE_COLOR=blue
GEOMETRY_PLUGIN_HYDRATE_SYMBOL=💧
GEOMETRY_PLUGIN_HYDRATE_INTERVAL=20  # interval in minutes
GEOMETRY_PLUGIN_HYDRATE_BINDKEY='^L' # wrap ^L bind to also hydrate
```
