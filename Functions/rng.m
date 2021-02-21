function rng = RNG(a,c,value)
    mod((a*value+c),100);
