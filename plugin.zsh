GEOMETRY_PLUGIN_HYDRATE_COLOR=${GEOMETRY_PLUGIN_HYDRATE_COLOR:-blue}
GEOMETRY_PLUGIN_HYDRATE_SYMBOL=${GEOMETRY_PLUGIN_HYDRATE_SYMBOL:-💧}
GEOMETRY_PLUGIN_HYDRATE_FILE=${GEOMETRY_PLUGIN_HYDRATE_FILE:-${TMPDIR:-/tmp}/water}
GEOMETRY_PLUGIN_HYDRATE_INTERVAL=${GEOMETRY_PLUGIN_HYDRATE_INTERVAL:-30} # in minutes
GEOMETRY_PLUGIN_HYDRATE_BINDKEY=${GEOMETRY_PLUGIN_HYDRATE_BINDKEY:-false} # rebind key to hydrate + clear + reset prompt, like '^L'

geometry_prompt_hydrate_setup() {
  test -f $GEOMETRY_PLUGIN_HYDRATE_FILE || touch $GEOMETRY_PLUGIN_HYDRATE_FILE
  test $GEOMETRY_PLUGIN_HYDRATE_BINDKEY && {
    GEOMETRY_PLUGIN_HYDRATE_PREVIOUSBIND=$(bindkey $GEOMETRY_PLUGIN_HYDRATE_BINDKEY | cut -d' ' -f2)
    zle-hydrate-widget() {
      hydrate
      local precmd
      for precmd in $precmd_functions; do $precmd; done
      zle $GEOMETRY_PLUGIN_HYDRATE_PREVIOUSBIND
    }
    zle -N zle-hydrate-widget
    bindkey $GEOMETRY_PLUGIN_HYDRATE_BINDKEY zle-hydrate-widget
  }
}

geometry_prompt_hydrate_check() {
  test $(print $GEOMETRY_PLUGIN_HYDRATE_FILE(.Nmm+$GEOMETRY_PLUGIN_HYDRATE_INTERVAL))
}

geometry_prompt_hydrate_render() {
  echo $(prompt_geometry_colorize $GEOMETRY_PLUGIN_HYDRATE_COLOR $GEOMETRY_PLUGIN_HYDRATE_SYMBOL)
}

hydrate() {
  touch $GEOMETRY_PLUGIN_HYDRATE_FILE
}
