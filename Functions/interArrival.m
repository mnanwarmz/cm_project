function interArrival = interArrival(rng)
    if(rng > 90)
        time = 60;
    else if(rng > 60)
        time = 50;
    else if(rng > 30)
        time = 40;
    else if(rng > 15)
        time = 30;
    else
        time = 20;
    end