#! /bin/sh

GPIOD=/sys/class/gpio
IPCD=/usr/local/etc

while true
do
    if [ ! -d ${GPIOD}/gpio2 ]; then
	echo 2 > ${GPIOD}/export
	echo out > ${GPIOD}/gpio2/direction
    fi
    
    if [ ! -d ${GPIOD}/gpio3 ]; then
	echo 3 > ${GPIOD}/export
	echo out > ${GPIOD}/gpio3/direction
    fi
    
    if [ ! -d ${GPIOD}/gpio6 ]; then
	echo 6 > ${GPIOD}/export
	echo out > ${GPIOD}/gpio6/direction
    fi
    #
    # For Watcg targets
    #
    echo 1 > ${GPIOD}/gpio2/value
    if [ -f ${IPCD}/D1.ipconf ]; then
	fping -q -f ${IPCD}/D1.ipconf
	if [ $? -eq 0 ]; then
	    echo 0 > ${GPIOD}/gpio2/value
	else
	    echo 1 > ${GPIOD}/gpio2/value
	fi
    else
	echo 1 > ${GPIOD}/gpio2/value
    fi

    #
    # For Log Server
    #
    echo 1 > ${GPIOD}/gpio3/value
    if [ -f ${IPCD}/D2.ipconf ]; then
	fping -q -f ${IPCD}/D2.ipconf
	if [ $? -eq 0 ]; then
	    echo 0 > ${GPIOD}/gpio3/value
	else
	    echo 1 > ${GPIOD}/gpio3/value
	fi
    else
	echo 1 > ${GPIOD}/gpio3/value
    fi

    #
    # For Gateway
    #
    echo 1 > ${GPIOD}/gpio6/value
    if [ -f ${IPCD}/D3.ipconf ]; then
	fping -q -f ${IPCD}/D3.ipconf
	if [ $? -eq 0 ]; then
	    echo 0 > ${GPIOD}/gpio6/value
	else
	    echo 1 > ${GPIOD}/gpio6/value
	fi
    else
	echo 1 > ${GPIOD}/gpio6/value
    fi
    sleep 5
done
