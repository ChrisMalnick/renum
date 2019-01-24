#!/bin/bash

###############################################################################
# File:		renum.sh
# 
# Summary:	Generates six digit sequence numbers of specified increment for all
# 		lines in specified file
# 
# Author:	Chris Malnick
# 
# Date:		1/22/2019
###############################################################################

readonly ARGC=2
readonly REGEX='^[0-9]{1,6}$'
readonly MAX=999999

if [[ (( "${#}" -ne "${ARGC}" )) ]]; then
	echo "Error: Invalid number of arguments."
	exit
fi

if [[ ! -f "${1}" ]]; then
	echo "Error: File not found."
	exit
fi

inc=$( echo "${2}" | sed 's/^0*//' )

if [[ ! "${inc}" || ! "${inc}" =~ ${REGEX} ]]; then
	echo "Error: Increment out of range."
	exit
fi

if [[ (( $(( $( wc -l < "${1}" ) * "${inc}" )) -gt "${MAX}" )) ]]; then
	echo "Error: Max sequence number exceeded."
	exit
fi

echo "Generating sequence numbers..."

curr=0

while IFS='' read -r line; do
	(( curr += "${inc}" ))
	
	curr=$( printf %06d "${curr}" )
	
	line="${line:6}"
	line="${curr}${line}"
	
	curr=$( echo "${curr}" | sed 's/^0*//' )
	
	echo "${line}" >> temp
done < "${1}"

rm "${1}"
mv temp "${1}"
