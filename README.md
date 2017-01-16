# Sensu /proc/net/snmp metrics extension
[![Gem Version](https://badge.fury.io/rb/sensu-extensions-proc-net-snmp.svg)](https://badge.fury.io/rb/sensu-extensions-proc-net-snmp)
[![Build Status](https://travis-ci.org/maoe/sensu-extensions-proc-net-snmp.svg?branch=master)](https://travis-ci.org/maoe/sensu-extensions-proc-net-snmp)

This check extension collects metrics in `/proc/net/snmp` on Linux and format them in the Graphite plaintext format. Sensu can send the collected metrics to Graphite or another TSDB as as InfluxDB.

## Installation

On a Sensu client machine:

```
sensu-install -e proc-net-snmp:0.0.1
```

Edit `/etc/sensu/conf.d/extensions.json` to load it:

```json
{
  "extensions": {
    "proc_net_snmp": {
      "version": "0.0.1"
    }
  }
}
```
or
```json
{
  "extensions": {
    "proc_net_snmp": {
      "gem": "sensu-extensions-proc-net-snmp"
    }
  }
}
```

Then restart the Sensu client:
```
sudo service sensu-client restart
```

## Configuration

Edit `/etc/sensu/conf.d/proc_net_snmp.json` to change its configuration:
```json
{
  "proc_net_snmp": {
    "interval": 60,
    "handler": "graphite",
    "add_client_prefix": true,
    "path_prefix": "proc.net.snmp",
    "prefix_at_start": true
  }
}
```
and these are the default values.

## Example output

```
com.sensuapp.demo.proc.net.snmp.ip.forwarding 1 1484531211
com.sensuapp.demo.proc.net.snmp.ip.defaultttl 64 1484531211
com.sensuapp.demo.proc.net.snmp.ip.inreceives 7224779 1484531211
com.sensuapp.demo.proc.net.snmp.ip.inhdrerrors 0 1484531211
com.sensuapp.demo.proc.net.snmp.ip.inaddrerrors 0 1484531211
com.sensuapp.demo.proc.net.snmp.ip.forwdatagrams 1650817 1484531211
com.sensuapp.demo.proc.net.snmp.ip.inunknownprotos 0 1484531211
com.sensuapp.demo.proc.net.snmp.ip.indiscards 0 1484531211
com.sensuapp.demo.proc.net.snmp.ip.indelivers 5573961 1484531211
com.sensuapp.demo.proc.net.snmp.ip.outrequests 5287993 1484531211
com.sensuapp.demo.proc.net.snmp.ip.outdiscards 44 1484531211
com.sensuapp.demo.proc.net.snmp.ip.outnoroutes 0 1484531211
com.sensuapp.demo.proc.net.snmp.ip.reasmtimeout 0 1484531211
com.sensuapp.demo.proc.net.snmp.ip.reasmreqds 0 1484531211
com.sensuapp.demo.proc.net.snmp.ip.reasmoks 0 1484531211
com.sensuapp.demo.proc.net.snmp.ip.reasmfails 0 1484531211
com.sensuapp.demo.proc.net.snmp.ip.fragoks 0 1484531211
com.sensuapp.demo.proc.net.snmp.ip.fragfails 0 1484531211
com.sensuapp.demo.proc.net.snmp.ip.fragcreates 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.inmsgs 170 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.inerrors 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.incsumerrors 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.indestunreachs 131 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.intimeexcds 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.inparmprobs 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.insrcquenchs 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.inredirects 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.inechos 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.inechoreps 39 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.intimestamps 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.intimestampreps 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.inaddrmasks 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.inaddrmaskreps 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.outmsgs 372 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.outerrors 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.outdestunreachs 225 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.outtimeexcds 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.outparmprobs 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.outsrcquenchs 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.outredirects 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.outechos 147 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.outechoreps 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.outtimestamps 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.outtimestampreps 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.outaddrmasks 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmp.outaddrmaskreps 0 1484531211
com.sensuapp.demo.proc.net.snmp.icmpmsg.intype0 39 1484531211
com.sensuapp.demo.proc.net.snmp.icmpmsg.intype3 131 1484531211
com.sensuapp.demo.proc.net.snmp.icmpmsg.outtype3 225 1484531211
com.sensuapp.demo.proc.net.snmp.icmpmsg.outtype8 147 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.rtoalgorithm 1 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.rtomin 200 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.rtomax 120000 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.maxconn -1 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.activeopens 73115 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.passiveopens 21 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.attemptfails 33777 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.estabresets 18421 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.currestab 22 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.insegs 5086735 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.outsegs 3427799 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.retranssegs 199 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.inerrs 120 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.outrsts 81584 1484531211
com.sensuapp.demo.proc.net.snmp.tcp.incsumerrors 0 1484531211
com.sensuapp.demo.proc.net.snmp.udp.indatagrams 587790 1484531211
com.sensuapp.demo.proc.net.snmp.udp.noports 217 1484531211
com.sensuapp.demo.proc.net.snmp.udp.inerrors 0 1484531211
com.sensuapp.demo.proc.net.snmp.udp.outdatagrams 268892 1484531211
com.sensuapp.demo.proc.net.snmp.udp.rcvbuferrors 0 1484531211
com.sensuapp.demo.proc.net.snmp.udp.sndbuferrors 0 1484531211
com.sensuapp.demo.proc.net.snmp.udp.incsumerrors 0 1484531211
com.sensuapp.demo.proc.net.snmp.udplite.indatagrams 0 1484531211
com.sensuapp.demo.proc.net.snmp.udplite.noports 0 1484531211
com.sensuapp.demo.proc.net.snmp.udplite.inerrors 0 1484531211
com.sensuapp.demo.proc.net.snmp.udplite.outdatagrams 0 1484531211
com.sensuapp.demo.proc.net.snmp.udplite.rcvbuferrors 0 1484531211
com.sensuapp.demo.proc.net.snmp.udplite.sndbuferrors 0 1484531211
com.sensuapp.demo.proc.net.snmp.udplite.incsumerrors 0 1484531211
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maoe/sensu-extensions-proc-net-snmp.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
