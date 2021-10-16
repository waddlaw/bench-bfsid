# bfsid

```
$ cabal bnech
All
  bfsid (small tree)
    Joe bfs1:    OK (0.19s)
      684  ns ±  46 ns
    Joe bfs2:    OK (0.12s)
      871  ns ±  84 ns
    Joe bfs3:    OK (0.17s)
      689  ns ±  42 ns
    Joe bfs4:    OK (0.17s)
      627  ns ±  51 ns
    Tomato bfs1: OK (0.21s)
      1.55 μs ±  86 ns
    Tomato bfs2: OK (0.28s)
      1.03 μs ±  48 ns
  bfsid (big tree)
    Joe bfs1:    OK (0.14s)
      551  μs ±  51 μs
    Joe bfs2:    OK (0.27s)
      18.0 ms ± 1.5 ms
    Joe bfs3:    OK (0.20s)
      13.3 ms ± 865 μs
    Joe bfs4:    OK (0.10s)
      14.0 ms ± 1.4 ms
    Tomato bfs1: OK (2.50s)
      80.0 ms ± 539 μs
    Tomato bfs2: OK (0.55s)
      77.0 ms ± 3.9 ms
```

---

```
$ cabal bench --benchmark-options '+RTS -T'
All
  bfsid (small tree)
    Joe bfs1:    OK (0.19s)
      680  ns ±  44 ns, 3.0 KB allocated,   0 B  copied,  34 MB peak memory
    Joe bfs2:    OK (0.23s)
      855  ns ±  42 ns, 4.0 KB allocated,   0 B  copied,  34 MB peak memory
    Joe bfs3:    OK (0.19s)
      694  ns ±  49 ns, 3.6 KB allocated,   0 B  copied,  34 MB peak memory
    Joe bfs4:    OK (0.17s)
      619  ns ±  60 ns, 3.0 KB allocated,   0 B  copied,  34 MB peak memory
    Tomato bfs1: OK (0.20s)
      1.48 μs ± 105 ns, 7.9 KB allocated,   0 B  copied,  34 MB peak memory
    Tomato bfs2: OK (0.28s)
      1.05 μs ±  52 ns, 6.4 KB allocated,   0 B  copied,  34 MB peak memory
  bfsid (big tree)
    Joe bfs1:    OK (0.14s)
      536  μs ±  46 μs, 2.6 MB allocated,  15 KB copied,  36 MB peak memory
    Joe bfs2:    OK (0.25s)
      17.2 ms ± 754 μs,   0 B  allocated,   0 B  copied,  36 MB peak memory
    Joe bfs3:    OK (0.42s)
      13.3 ms ± 626 μs,   0 B  allocated,   0 B  copied,  36 MB peak memory
    Joe bfs4:    OK (0.20s)
      13.5 ms ± 751 μs,   0 B  allocated,   0 B  copied,  36 MB peak memory
    Tomato bfs1: OK (0.57s)
      79.2 ms ± 2.6 ms, 455 MB allocated, 2.2 MB copied,  53 MB peak memory
    Tomato bfs2: OK (0.23s)
      76.4 ms ± 4.4 ms, 447 MB allocated, 1.4 MB copied,  53 MB peak memory
```

---

```
$ cabal exec -- hyperfine 'joe-bfsid' 'tomato-bfsid'
Benchmark #1: joe-bfsid
  Time (mean ± σ):       3.3 ms ±   0.1 ms    [User: 3.3 ms, System: 0.2 ms]
  Range (min … max):     3.1 ms …   4.2 ms    724 runs
 
  Warning: Command took less than 5 ms to complete. Results might be inaccurate.
  Warning: Statistical outliers were detected. Consider re-running this benchmark on a quiet PC without any interferences from other programs. It might help to use the '--warmup' or '--prepare' options.
 
Benchmark #2: tomato-bfsid
  Time (mean ± σ):      80.3 ms ±   1.4 ms    [User: 78.9 ms, System: 1.5 ms]
  Range (min … max):    78.2 ms …  84.8 ms    35 runs
 
Summary
  'joe-bfsid' ran
   24.59 ± 0.94 times faster than 'tomato-bfsid'
```