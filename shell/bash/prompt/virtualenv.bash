function _virtualenv_prompt(){
    command -v virtualenv > /dev/null 2>&1 || return
    local prefix="$1"
    local suffix="$2"
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        printf "%s" "${prefix}${VIRTUAL_ENV##*/}${suffix}"
    fi
}
