!function t(e, r, n) {
    alert('iifksp')
}({15: [function (t, e, r) {
    var n = function () {
        var t = String.fromCharCode,
            e = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-$",
            r = {
                compressToUTF16: function (e) {
                    return null == e ? "" : r._compress(e, 15, function (e) {
                        return t(e + 32)
                    }) + " "
                },
                compressToUint8Array: function (t) {
                    for (var e = r.compress(t), n = new Uint8Array(2 * e.length), i = 0, o = e.length; o > i; i++) {
                        var a = e.charCodeAt(i);
                        n[2 * i] = a >>> 8, n[2 * i + 1] = a % 256
                    }
                    return n
                },
                compressToEncodedURIComponent: function (t) {
                    return null == t ? "" : r._compress(t, 6, function (t) {
                        return e.charAt(t)
                    })
                },
                compress: function (e) {
                    return r._compress(e, 16, function (e) {
                        return t(e)
                    })
                },
                _compress: function (t, e, r) {
                    if (null == t) return "";
                    var n, i, o, a = {},
                        s = {},
                        u = "",
                        d = "",
                        c = "",
                        h = 2,
                        l = 3,
                        p = 2,
                        f = [],
                        g = 0,
                        v = 0;
                    for (o = 0; o < t.length; o += 1)
                        if (u = t.charAt(o), Object.prototype.hasOwnProperty.call(a, u) || (a[u] = l++, s[u] = !0), d = c + u, Object.prototype.hasOwnProperty.call(a, d)) c = d;
                        else {
                            if (Object.prototype.hasOwnProperty.call(s, c)) {
                                if (c.charCodeAt(0) < 256) {
                                    for (n = 0; p > n; n++) g <<= 1, v == e - 1 ? (v = 0, f.push(r(g)), g = 0) : v++;
                                    for (i = c.charCodeAt(0), n = 0; 8 > n; n++) g = g << 1 | 1 & i, v == e - 1 ? (v = 0, f.push(r(g)), g = 0) : v++, i >>= 1
                                } else {
                                    for (i = 1, n = 0; p > n; n++) g = g << 1 | i, v == e - 1 ? (v = 0, f.push(r(g)), g = 0) : v++, i = 0;
                                    for (i = c.charCodeAt(0), n = 0; 16 > n; n++) g = g << 1 | 1 & i, v == e - 1 ? (v = 0, f.push(r(g)), g = 0) : v++, i >>= 1
                                }
                                h--, 0 == h && (h = Math.pow(2, p), p++), delete s[c]
                            } else
                                for (i = a[c], n = 0; p > n; n++) g = g << 1 | 1 & i, v == e - 1 ? (v = 0, f.push(r(g)), g = 0) : v++, i >>= 1;
                            h--, 0 == h && (h = Math.pow(2, p), p++), a[d] = l++, c = String(u)
                        } if ("" !== c) {
                        if (Object.prototype.hasOwnProperty.call(s, c)) {
                            if (c.charCodeAt(0) < 256) {
                                for (n = 0; p > n; n++) g <<= 1, v == e - 1 ? (v = 0, f.push(r(g)), g = 0) : v++;
                                for (i = c.charCodeAt(0), n = 0; 8 > n; n++) g = g << 1 | 1 & i, v == e - 1 ? (v = 0, f.push(r(g)), g = 0) : v++, i >>= 1
                            } else {
                                for (i = 1, n = 0; p > n; n++) g = g << 1 | i, v == e - 1 ? (v = 0, f.push(r(g)), g = 0) : v++, i = 0;
                                for (i = c.charCodeAt(0), n = 0; 16 > n; n++) g = g << 1 | 1 & i, v == e - 1 ? (v = 0, f.push(r(g)), g = 0) : v++, i >>= 1
                            }
                            h--, 0 == h && (h = Math.pow(2, p), p++), delete s[c]
                        } else
                            for (i = a[c], n = 0; p > n; n++) g = g << 1 | 1 & i, v == e - 1 ? (v = 0, f.push(r(g)), g = 0) : v++, i >>= 1;
                        h--, 0 == h && (h = Math.pow(2, p), p++)
                    }
                    for (i = 2, n = 0; p > n; n++) g = g << 1 | 1 & i, v == e - 1 ? (v = 0, f.push(r(g)), g = 0) : v++, i >>= 1;
                    for (;;) {
                        if (g <<= 1, v == e - 1) {
                            f.push(r(g));
                            break
                        }
                        v++
                    }
                    return f.join("")
                }
            };
        return r
    }();
    e.exports = n
}, {}]})