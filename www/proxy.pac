function FindProxyForURL(url, host) {
    var proxy = "PROXY nan.campjs:3128";
    var direct = "DIRECT";

    if(dnsDomainIs(host, ".lvh.me")) {
      return direct;
    }

    // no proxy for local hosts without domain:
    if(isPlainHostName(host)) {
      return direct;
    }

    // proxy everything else:
    return proxy;
}
