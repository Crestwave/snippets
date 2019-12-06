# POSIX trap

Lets say we want to run something when a script exits, usually a cleanup function. The solution is obvious, isn't it?


```sh
trap 'echo done' EXIT
```

The condition for `EXIT` is mostly undefined by POSIX; this works in Bash, but not `ash` and `dash`, which don't trigger `EXIT` on signals.

```sh
trap 'echo done' EXIT INT
```

This overrides the default handling of `SIGINT`, so it will trigger the trap instead of exiting the script.

```sh
trap 'echo done; exit' EXIT INT
```

This triggers twice on `SIGINT`, because the `exit` triggers `EXIT`.

```sh
trap 'echo done; kill 0' EXIT INT
```

This displays "Terminated" on a regular exit, which may not be desirable.

```sh
trap 'echo done' EXIT
trap 'echo done; kill 0' INT
```

This works well, but wait! Remember when I mentioned that some shells don't trigger `EXIT` on signals? That includes `TERM`, which you might want to handle, too!

```sh
trap 'echo done' EXIT
trap 'echo done; kill 0' INT TERM
```

`kill 0` sends `TERM` by default, so it triggers itself. You could use `QUIT`, but that's supposed to dump core. So why don't we take a different approach?

```sh
trap 'trap - EXIT; echo done; exit' EXIT INT TERM
```

But this doesn't preserve the exit code in `ash`!

```sh
trap 'rc=$?; trap - EXIT; echo done; exit $rc' EXIT INT TERM
```

Repeating a signal could trigger the trap multiple times here. This probably wouldn't happen in this particular example, but what if you're running something that takes a second or so?

```sh
trap 'rc=$?; trap - 0 2 15; echo done; exit $rc' 0 2 15
```

I've switched to using the signal numbers because it's getting pretty long, but it doesn't change the functionality. This is close, but there's still an edge case with `SIGINT` for its caller; for example, if you run a script with this from a Bash script, sending `SIGINT` would terminate this script, but not the Bash script. You can see this behavior with commands like `ping`, and the proper behavior, which is to re-raise the signal, with commands like `sleep`.


```sh
trap 'rc=$?; trap - 0 15; echo done; exit $rc' 0 15
trap 'trap - 2; echo done; kill -s 2 $$' 2
```

But if you repeat `SIGINT`, you could cancel whatever is run, which could be undesirable depending on your script. And as we know by now, disabling the trap after what you run could allow it to run multiple times.

```sh
trap 'rc=$?; trap - 0 15; echo done; exit $rc' 0 15
trap 'trap - 2; trap "" 2; echo done; kill -s 2 $$' 2
```
But now it triggers twice. What is this witchery? Can we make use of this?

```sh
trap 'rc=$?; trap - 0 15; echo done; exit $rc' 0 15
trap 'trap "" 2; kill -s 2 $$' 2
```

Wait; whatever you run could still be killed prematurely by `TERM`. This seems more reasonable than with `INT`, but what if you don't want it to be killed except in an emergency `QUIT` or `KILL`?


```sh
trap 'rc=$?; trap - 0 15; trap "" 15; echo done; exit $rc' 0 15
trap 'trap "" 2; kill -s 2 $$' 2
```

Note that if it a script with this is running an external command, it waits for it to finish before reacting to `TERM`, but that's how `trap` works. If you want to terminate the command, you can send it to the script's process group, which is what `^C` does with `INT`.
