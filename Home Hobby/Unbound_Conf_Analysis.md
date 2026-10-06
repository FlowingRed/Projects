```
server:
    verbosity: 0
    interface: 127.0.0.1
    port: 5335
    do-ip4: yes
    do-udp: yes
    do-tcp: yes
    do-ip6: no

    # Security
    harden-glue: yes
    harden-dnssec-stripped: yes
    use-caps-for-id: no
    edns-buffer-size: 1232

    # Performance
    prefetch: yes
    prefetch-key: yes
    serve-expired: yes
    serve-expired-ttl: 86400
    serve-expired-client-timeout: 1800

    # Allow only localhost (Pi-hole will be the only caller)
    access-control: 127.0.0.1/32 allow
    
    #DNSSEC
    module-config: "validator iterator"
    auto-trust-anchor-file: "/var/lib/unbound/root.key"
    val-clean-additional: yes
    val-permissive-mode: no
    val-log-level: 1

    #Root Hints for bootstrapping
    root-hints: "/usr/share/dns/root.hints"

    #log
    log-queries: yes
    log-replies: yes
    log-servfail: yes

    #Performance Tuning
    num-threads: 4
    msg-cache-slabs: 4
    rrset-cache-slabs: 4
    infra-cache-slabs: 4
    key-cache-slabs: 4

    #Cache Size
    msg-cache-size: 128m
    rrset-cache-size: 256m
    key-cache-size: 32m
    neg-cache-size: 16m

    #hardened
    hide-identity: yes
    hide-version: yes
    harden-dnssec-stripped: yes
    harden-below-nxdomain: yes
    harden-referral-path: yes
    harden-algo-downgrade: yes
    use-caps-for-id: yes
    qname-minimisation: yes
    qname-minimisation-strict: no

    # Performance
    prefetch: yes
    num-threads: 1
    so-rcvbuf: 1m 
```

⚠️ **Status: Draft / WIP.** This is a summary of my current understanding of the options. This document is in progress and in no way does this represent complete work.
## General
- Verbosity: verbosity is set to 0 since all I want to see is errors plus I am not going to really look at the logs that often.

- Interface & port: Unbound listens on IP address 127.0.0.1 on port 5335. The specificc port number does not matter. 127.0.0.1 is used because unbound does receive request from the client directly all dns request are taken after pihole processes them (allow or deny).

- do-ip4, do-udp, do-tcp, etc: both tcp and udp are enabled so dns requests will actually work ipv6 is disabled because there are no ipv6 addresses devices on the local network.
## Security

- Harden glue: the purpose of harden glue is to reject IP addresses outside of the responding servers own zone authority. This prevents a malicious or potentially compromised **TLD** authoritative server from stuffing in glue for a domain it has no actual authority over.
	- The glue records is the record that points to a domain’s nameserver IP address. Said nameserver can then be quried to look up all other subdomains under that domain. (`example.com`)

