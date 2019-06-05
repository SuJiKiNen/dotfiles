#!/usr/bin/env bash
function _python_version_prompt(){
    command -v python > /dev/null 2>&1 || return
    local _py_version
    _py_version=$(python --version 2>&1 | cut -d ' ' -f2)
    local prefix="$1"
    local suffix="$2"
    if [[ -n "$_py_version" ]]; then
        printf "%s" "${prefix}${_py_version}${suffix}"
    fi
}
