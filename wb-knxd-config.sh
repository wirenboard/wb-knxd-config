#!/bin/bash
json1=$(jq '' /etc/wb-knxd-config.conf)
f=$(echo $json1 | jq '.global.f' | sed -e 's/\"//g')
t=$(echo $json1 | jq '.global.t' | sed -e 's/\"//g')
c=$(echo $json1 | jq '.cache.c' | sed -e 's/\"//g')
e=$(echo $json1 | jq '.address.e' | sed -e 's/\"//g')
E=$(echo $json1 | jq '.address.E' | sed -e 's/\"//g')
b=$(echo $json1 | jq '.interface.b' | sed -e 's/\"//g')
i=$(echo $json1 | jq '.localListener.i' | sed -e 's/\"//g')
u=$(echo $json1 | jq '.localListener.u' | sed -e 's/\"//g')
D=$(echo $json1 | jq '.multicastServer.D' | sed -e 's/\"//g')
T=$(echo $json1 | jq '.multicastServer.T' | sed -e 's/\"//g')
R=$(echo $json1 | jq '.multicastServer.R' | sed -e 's/\"//g')
S=$(echo $json1 | jq '.multicastServer.S' | sed -e 's/\"//g')
n=$(echo $json1 | jq '.multicastServer.n' | sed -e 's/\"//g')
forced=$(echo $json1 | jq '.multicastServer.forced' | sed -e 's/\"//g')
name=$(echo $json1 | jq '.multicastServer.name'| sed -e 's/\"//g')
Server=$(echo $json1 | jq '.multicastServer.Server'| sed -e 's/\"//g')
if [ "$f" = "null" ]
then
	f=""
else
	f="-f$f "
fi
if [ "$t" = "null" ]
then
	t=""
else
	t="-t$t "
fi
if [ "$e" = "" ]
then
	e="-e 0.0.1 "
else
	e="-e $e "
fi
if [ "$E" = "" ]
then
	E="-E 0.0.2:50 "
else
	E="-E $E "
fi
if [ "$c" = "true" ]
then
	c="-c "
else
	c=""
fi
if [ "$forced" = "true" ]
then
	forced="--allow-forced-broadcast "
else
	forced=""
fi
if [ "$D" = "true" ]
then
	D="-D "
else
	D=""
fi
if [ "$T" = "true" ]
then
	T="-T "
else
	T=""
fi
if [ "$R" = "true" ]
then
	R="-R "
else
	R=""
fi
if [ "$n" = "true" ]
then
	if [ "$name" = "" ]
	then
		name="knxd"
	fi
	n="-n '$name' "
else
	n=""
fi
if [ "$S" = "true" ]
then
	if [ "$Server" = "" ]
	then
		Server="224.0.23.12:3671"
	fi
	S="-S $Server "
else
	S=""
fi
if [ "$i" = "" ]
then
	i="-i 6720 "
elif [ "$i" = "null" ]
then
	i=""
else
	i="-i $i "
fi
if [ "$u" = "" ]
then
	u="-u /var/run/knx "
elif [ "$u" = "null" ]
then
	u=""	
else
	u="-u $u "
fi
if [ "$b" = "" ]
then
	b="-b ncn5120:/dev/ttyMOD1"
else
	b="-b $b"
fi
#knxd [global-section] [address-section] [cache-section] [multicast-server-section] [local-listener-section] [interface-sections]
echo "KNXD_OPTS=\"$t$f$e$E$c$forced$D$T$R$n$S$i$u$b\"" > /etc/knxd.conf
service knxd restart
