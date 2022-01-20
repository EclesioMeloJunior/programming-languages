use "date.sml";

fun number_in_month(d : (int*int*int) option list, m : int) =
    case d of
        [] => 0
        | i0::rest => 
            if isSome i0 
            then
                let
                    val date = valOf i0
                in
                    if (#2 date) = m
                    then 1 + number_in_month(rest, m)
                    else 0 + number_in_month(rest, m)
                end
            else 0 + number_in_month(rest, m)

fun test() =
    let
        val c = new_date(0, 11, ~1)
        val x = new_date(10, 11, 2014)
        val z = new_date(11, 08, 2016)
        val a = new_date(7, 08, 2017)
        val b = new_date(15, 11, 2018)
        val y = new_date(2, 1, 2019)

        fun test_cases(t_cases : {date_list : (int*int*int) option list, month : int, expected : int} list) =
            case t_cases of 
                [] => true
                | t_case::rest =>
                    let 
                        val n = number_in_month(#date_list t_case, #month t_case);
                        val exp = #expected t_case;
                    in    
                        print("expected = " ^ Int.toString exp ^ " got = " ^ Int.toString n ^ "\n");
                        if n = exp
                        then test_cases(rest)
                        else false
                    end
    in
        test_cases([
            {date_list = [c,x,z,a,b,y], month = 8, expected = 2},
            {date_list = [c,x,z,a,b,y], month = 11, expected = 2},
            {date_list = [c,x,z,a,b,y], month = 1, expected = 1},
            {date_list = [b,y], month = 11, expected = 1},
            {date_list = [c], month = 11, expected = 0},
            {date_list = [], month = 0, expected = 0}
        ])
    end