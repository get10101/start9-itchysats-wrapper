#!/bin/sh

check_api(){
    DURATION=$(</dev/stdin)
    if (($DURATION <= 5000 )); then
        exit 60
    else
        curl --silent --fail "itchysats.embassy:8000/api/alive" &>/dev/null
        RES=$?
        if test "$RES" != 0; then
            echo "ItchySats API is unreachable" >&2
            exit 1
        fi
    fi
}

check_web(){
    DURATION=$(</dev/stdin)
    if (($DURATION <= 5000 )); then
        exit 60
    else
        curl --silent --fail itchysats.embassy:8000 &>/dev/null
        RES=$?
        if test "$RES" != 0; then
            echo "The ItchySats UI is unreachable" >&2
            exit 1
        fi
    fi
}


case "$1" in
	api)
        check_api
        ;;
	web)
        check_web
        ;;
    *)
        echo "Usage: $0 [command]"
        echo
        echo "Commands:"
        echo "         api"
        echo "         web"
esac