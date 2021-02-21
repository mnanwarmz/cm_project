function serviceTime = serviceTime(rng,counter)
    if(counter == 1)
        if(rng > 80)
            time = 50;
        else if(rng > 55)
            time = 40;
        else if(rng > 25)
            time = 30;
        else if(rng > 10)
            time = 20;
        else
            time = 10;
        end
    end
    if(counter == 2)
        if(rng > 85)
            time = 35;
        else if(rng > 65)
            time = 30;
        else if(rng > 40)
            time = 25;
        else if(rng > 15)
            time = 20;
        else
            time = 15;
        end
    end
    if(counter != 1 && counter != 2)
    fprintf("All Counters are busy")
