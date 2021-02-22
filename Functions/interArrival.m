function interArrival = interArrival(rng)
    if(rng > 90)
        time = 60;
    elseif(rng > 60)
        time = 50;
    elseif(rng > 30)
        time = 40;
    elseif(rng > 15)
        time = 30;
    else
        time = 20;
    end