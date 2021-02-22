function Main()

    tables();
    printf('Welcome to Maxis Service Centre \n');
    printf('Here are the types of random number generator available with us \n');
    printf('1 : Additive Generator \n');
    printf('2 : Multiplicative Generator \n');
    printf('3 : Mixed Generator \n');

    rngType = input('Choose a random number generator to be used : \n');
    a = randi(1,98);
    c = randi(1,98);
    initial  = randi(1,98);
    counter1 = 0;
    counter2 = 0;
    counter1.startTime = 0;
    counter2.startTime = 0;
    counter1.finishTime = 0;
    counter2.finishTime = 0;



    if(rngType == 1)
        initialRNG = (RNG(0,c,value));
    if(rngType == 2)
        initialRNG = (RNG(a,0,value));
    if(rngType == 3)
        initialRNG = (RNG(a,c,value));

    customerCount = input('Enter Number of Customers : \n');
    for i=1:customerCount
        customer(i).temp = randi(36,39);

        % First Iteration
        if(i == 1)
            customer(i).interArrival = interArrival(initialRNG);
            customer(i).arrival = 0;
            customer(i).rng = initialRNG;
            customer(i).serviceTime = serviceTime(initialRNG);
            customer(i).serviceEnd = customer(i).arrival + customer(i).serviceTime;
            counter1.finishTime = customer(i).serviceEnd;

            else

                    if(counter1.finishTime <= counter2.finishTime)
                        %Additive Generator
                        if(rngType == 1)
                            customer(i).rng = RNG(0,c,customer(i-1).rng);
                            customer(i).interArrival = interArrival(RNG(0,c,customer(i).rng));
                            customer(i).serviceTime = serviceTime(RNG(0,c,customer(i).rng,1));
                        end

                        %Multiplicative Generator
                        if(rngType == 2)
                            customer(i).rng = RNG(a,0,customer(i-1).rng);
                            customer(i).interArrival = interArrival(RNG(a,0,customer(i).rng));
                            customer(i).serviceTime = serviceTime(RNG(a,0,customer(i).rng,1));
                        end

                        %Mixed Generator
                        if(rngType == 3)
                            customer(i).rng = RNG(a,c,customer(i-1).rng);
                            customer(i).interArrival = interArrival(RNG(a,c,customer(i).rng));
                            customer(i).serviceTime = serviceTime(RNG(a,c,customer(i).rng,1));
                        end
                        customer(i).arrival = customer(i).interArrival + customer(i-1).arrival;

                            if(customer(i).arrival > counter1.finishTime)
                                customer(i).serviceBegin =  customer(i).arrival;
                                customer(i).waitingTime = 0;
                            else
                                customer(i).serviceBegin =  counter1.finishTime;
                                customer(i).waitingTime = customer(i).serviceEnd - customer(i).arrival;
                            end
                                counter1.finishTime = customer(i).serviceTime + customer(i).serviceBegin;
                                customer(i).serviceEnd = counter1.finishTime;

                            else
                                %Additive Generator
                                if(rngType == 1)
                                    customer(i).rng = RNG(0,c,customer(i-1).rng);
                                    customer(i).interArrival = interArrival(RNG(0,c,customer(i).rng));
                                    customer(i).serviceTime = serviceTime(RNG(0,c,customer(i).rng,2));
                                end

                                %Multiplicative Generator
                                if(rngType == 2)
                                    customer(i).rng = RNG(a,0,customer(i-1).rng);
                                    customer(i).interArrival = interArrival(RNG(a,0,customer(i).rng));
                                    customer(i).serviceTime = serviceTime(RNG(a,0,customer(i).rng,2));
                                end

                                %Mixed Generator
                                if(rngType == 3)
                            customer(i).rng = RNG(a,c,customer(i-1).rng);
                            customer(i).interArrival = interArrival(RNG(a,c,customer(i).rng));
                            customer(i).serviceTime = serviceTime(RNG(a,c,customer(i).rng,2));
                        end
                        customer(i).arrival = customer(i).interArrival + customer(i-1).arrival;
                        if(customer(i).arrival > counter2.finishTime)
                            customer(i).serviceBegin =  customer(i).arrival;
                            customer(i).waitingTime = 0;
                        else
                            customer(i).serviceBegin =  counter2.finishTime;
                            customer(i).waitingTime = customer(i).serviceEnd - customer(i).arrival;
                        end
                            counter2.finishTime = customer(i).serviceTime + customer(i).serviceBegin;
                            customer(i).serviceEnd = counter2.finishTime;
                    end
                end
            end
        end
    end


    maxCustomerCount = input('Enter the limit for the amount of customers available at one time in the centre : \n');
