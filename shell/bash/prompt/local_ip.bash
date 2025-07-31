function _get_local_ip() {
    command -v python3 > /dev/null 2>&1 || return
    # https://stackoverflow.com/questions/166506/finding-local-ip-addresses-using-pythons-stdlib
    printf "%s" "$(python3 -c "
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

_local_ip=$(_get_local_ip)

function _local_ip_prompt() {
    if [[ -n "${_local_ip}" ]]; then
        local prefix="$1"
        local suffix="$2"
        printf "%s" "${prefix}${_local_ip}${suffix}"
    fi
}
