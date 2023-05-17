#!/bin/bash

OPENOCD_BIN=openocd

unset BOARD
unset DEBUG
unset CPU_COUNT
unset SOFT_TAP

CPU_COUNT=1
DEBUG=1
SOFT_TAP=0

usage() {
    echo Usage
    echo
    echo "-b, board       Board can be t120, ti60 or ti180"
    echo "-c, cpu count   Number of CPU. Default is 1"
    echo "-i, interface   Debug interface. Default is 1"
    echo "                1 - RISCV Standard Debug Interface"
    echo "                0 - Vexriscv Debug Interface"
    echo "-s, soft tap    Using soft tap instead of hard JTAG. Default is using"
    echo "                hard JTAG."
    echo "-d, debug       Show debug message"
    echo
    echo "Example,"
    echo "$0 -b ti180 -c 4"

    exit 1
}

while getopts ":b:c:dis" options; do
    case "${options}" in
        b)
	    BOARD=${OPTARG}
	    ;;
	c)
	    CPU_COUNT=${OPTARG}
	    ;;
	d)
	    DBG=1;
	    ;;
        i)
	    DEBUG=0
	    ;;
	s)
	    SOFT_TAP=1
	    ;;
        *)
            usage
	    ;;
    esac
done

if [[ $OPTIND -eq 1 ]]; then
    usage
fi

if [[ -z $BOARD ]]; then
    echo Error: Board is empty
    exit 1
fi

export BOARD=$BOARD
export DEBUG=$DEBUG
export SOFT_TAP=$SOFT_TAP
export CPU_COUNT=$CPU_COUNT

if [[ $DBG -eq 1 ]]; then
    echo BOARD = $BOARD
    echo DEBUG = $DEBUG
    echo SOFT_TAP = $SOFT_TAP
    echo CPU_COUNT = $CPU_COUNT
    echo
fi

$OPENOCD_BIN -f soc_debug.cfg
