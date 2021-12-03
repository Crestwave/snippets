#!/usr/bin/awk -f
{
    p = 1

    for (i = 1; i <= NF; ++i) {
        if ($i ~ /^[+-]?[0-9.]+$/) {
            s[++p] = $i
            continue
        }

	y = s[p--]
	x = s[p]

        if ($i == "+")
            s[p] = x + y
        else if ($i == "-")
            s[p] = x - y
        else if ($i == "*")
            s[p] = x * y
        else if ($i == "/")
            s[p] = x / y
        else if ($i == "^")
            s[p] = x ^ y
        else if ($i == "%")
            s[p] = x % y
        else
            next
    }

    print s[p]
}

