function v = calculateVolume(h)
    r = 3;
    p = 3.141592653;
    v = p*h*h*(3*r-h)/3 - 30;
    %-30 is here because we want the minimum volume to be 30.
end

