function _virtualenv_prompt {
    if [ -n "$VIRTUAL_ENV" ]; then
        local prefix="$1"
        local suffix="$2"
        # Strip out the path and just leave the env name
        printf "%s" "${prefix}${VIRTUAL_ENV##*/}${suffix}"
    fi
}
