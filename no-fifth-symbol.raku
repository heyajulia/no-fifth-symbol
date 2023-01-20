unit sub MAIN();

my $violations = 0;

for $*IN."lin\x65s"().kv -> $i, $ln {
    if $ln ~~ rx:i/\x45 | \x65/ {
        $violations += $ln.comb ~~ m:i:g/\x45 | \x65/;

        printf "%-4s | ", $i + 1;
        say S:i:g/(\x45 | \x65)/\x1b[91m$0\x1b[0m/ with $ln;
    }
}

if $violations > 0 {
    say "\n\n$violations violation(s) found. Fix your program.";
    exit 1;
}

say "\n\nNo violations found. Good job!";
