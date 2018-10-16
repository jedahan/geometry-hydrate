# geometry_hydrate - remind you to hydrate

: ${GEOMETRY_HYDRATE_COLOR:=blue}
: ${GEOMETRY_HYDRATE_SYMBOL:=💧}
: ${GEOMETRY_HYDRATE_FILE:=${TMPDIR:=/tmp}/water}
: ${GEOMETRY_HYDRATE_MINUTES:=30}
: ${GEOMETRY_HYDRATE_BINDKEY:='^L'} # key to hydrate with

(( $+functions[geometry_hydrate] )) && return

test -f $GEOMETRY_HYDRATE_FILE || touch $_

test -n $GEOMETRY_HYDRATE_BINDKEY && {
    local previous_bind=$(bindkey $GEOMETRY_HYDRATE_BINDKEY | cut -d' ' -f2)
    zle-hydrate-widget() {
      hydrate
      local precmd
      for precmd in $precmd_functions; do $precmd; done
      zle $previous_bind
    }
    zle -N zle-hydrate-widget
    bindkey $GEOMETRY_HYDRATE_BINDKEY zle-hydrate-widget
}

function geometry_hydrate {
  test $(print $GEOMETRY_HYDRATE_FILE(.Nmm+$GEOMETRY_HYDRATE_MINUTES)) || return
  echo -n $(color $GEOMETRY_HYDRATE_COLOR $GEOMETRY_HYDRATE_SYMBOL)
}

hydrate() {
  touch $GEOMETRY_HYDRATE_FILE
}
