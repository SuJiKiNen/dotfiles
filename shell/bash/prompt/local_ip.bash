function _get_local_ip() {
    command -v python > /dev/null 2>&1 || return
    # https://stackoverflow.com/questions/166506/finding-local-ip-addresses-using-pythons-stdlib
    printf "%s" "$(python -c "
import socket
def get_ip():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # doesn't even have to be reachable
        s.connect(('10.255.255.255', 1))
        IP = s.getsockname()[0]
    except:
        IP = ''
    finally:
        s.close()
    return IP
print(get_ip())
")"
}

function _read_ip_from_conf {
    if [ -n "$_local_ip" ]; then
        print "%s" _local_ip
    else
        mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}"
        IP_CACHE=${XDG_CACHE_HOME:-$HOME/.cache}/ip.cache
        if [ -s "$IP_CACHE" ]; then
            printf "%s" "$(<"$IP_CACHE")"
            _get_local_ip > "$IP_CACHE" &
            return 0
        else
            _get_local_ip > "$IP_CACHE" &
            return 1
        fi
    fi
}

_local_ip=$(_read_ip_from_conf)

function _local_ip_prompt() {
    if [ -n "${_local_ip}" ]; then
        local prefix="$1"
        local suffix="$2"
        printf "%s" "${prefix}${_local_ip}${suffix}"
    fi
}
