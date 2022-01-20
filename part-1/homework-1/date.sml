fun new_date(d : int, m : int, y : int) =
    if d < 1 andalso d > 31
    then NONE
    else if m < 1 andalso m > 12
    then NONE
    else if y < 1
    then NONE
    else SOME((d, m, y))
