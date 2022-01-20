use "date.sml";

fun is_older(a : (int*int*int) option, b : (int*int*int) option) =
    case a of
        SOME first => case b of
            SOME second =>
                if (#3 first) > (#3 second)
                then SOME(false)
                else if (#3 first) < (#3 second)
                then SOME(true)
                else if (#2 first) > (#2 second)
                then SOME(false)
                else if (#2 first) < (#2 second)
                then SOME(true)
                else if (#1 first) > (#1 second)
                then SOME(false)
                else if (#1 first) < (#1 second)
                then SOME(true)
                else SOME(false)
        | NONE => NONE

fun test() =
    let
        val first_date = new_date(10, 10, 2010);
        val second_date = new_date(10, 11, 2010);
    in 
        if is_older(first_date, second_date)
        then print("SUCCESS")
        else print("first_date should be lower than second_date. expected=true")

        if is_older(second_date, second_date) = false
        then print("SUCCESS")
        else print("second_date is not greater than second_date. expected=false")

        if is_older(second_date, first_date) = false
        then print("SUCCESS")
        else print("first_date is not greater than second_date. expected=false")
    end