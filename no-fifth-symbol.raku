unit sub MAIN();

my $violations = 0;

for ((1..*) Z $*IN.lines) -> ($ln-no, $ln) {
    if $ln ~~ rx:i/\x65/ {
        $violations += $ln.comb ~~ m:i:g/\x65/;

        printf "%-4s | ", $ln-no;
        
        say S:i:g/(\x65)/\o33[91m$0\o33[0m/ with $ln;
    }
}

if $violations > 0 {
    say "\n\n$violations violations found. Fix your program.";
    exit 1;
} else {
    say "\n\nNo violations found. Good job!";
}
