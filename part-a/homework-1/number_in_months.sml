use "date.sml";
use "number_in_month.sml";

fun number_in_months(ds: (int*int*int) option list, ms : int list) =
    case ms of
        [] => 0
        | m0::rest =>
            number_in_month(ds, m0) + number_in_months(ds, rest)

fun test() = 
    let
        fun test_cases(t_cases : {date_list : (int*int*int) option list, months : int list, expected : int} list) =
            case t_cases of 
                [] => true
                | t_case::rest =>
                    let 
                        val n = number_in_months(#date_list t_case, #months t_case);
                        val exp = #expected t_case;
                    in    
                        print("expected = " ^ Int.toString exp ^ " got = " ^ Int.toString n ^ "\n");
                        if n = exp
                        then test_cases(rest)
                        else false
                    end
    in
        test_cases([
            {
                date_list = [
                    new_date(01, 01, 2001),
                    new_date(01, 02, 2002),
                    new_date(01, 03, 2001)
                ],
                months = [1, 2, 3],
                expected = 3
            },
            {
                date_list = [
                    new_date(01, 01, 2001),
                    new_date(01, 12, 2002),
                    new_date(01, 05, 2001)
                ],
                months = [1, 2, 3],
                expected = 1
            }
        ])
    end