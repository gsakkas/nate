
let rec digitsOfInt n =
  let rec digitsOfIntHelper n result =
    if n > 0
    then (digitsOfIntHelper (n / 10) (n mod 10)) :: result
    else result in
  digitsOfIntHelper n [];;


(* fix

let rec digitsOfInt n =
  let rec digitsOfIntHelper n result =
    if n > 0
    then digitsOfIntHelper (n / 10) ((n mod 10) :: result)
    else result in
  digitsOfIntHelper n [];;

*)

(* changed spans
(5,9)-(5,58)
digitsOfIntHelper (n / 10)
                  ((n mod 10) :: result)
AppG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG)])

*)

(* changed exprs
App (Just (5,9)-(5,58)) (Var (Just (5,9)-(5,26)) "digitsOfIntHelper") [Bop (Just (5,27)-(5,35)) Div (Var (Just (5,28)-(5,29)) "n") (Lit (Just (5,32)-(5,34)) (LI 10)),ConApp (Just (5,36)-(5,58)) "::" (Just (Tuple (Just (5,37)-(5,57)) [Bop (Just (5,37)-(5,47)) Mod (Var (Just (5,38)-(5,39)) "n") (Lit (Just (5,44)-(5,46)) (LI 10)),Var (Just (5,51)-(5,57)) "result"])) Nothing]
*)

(* typed spans
(5,9)-(5,58)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
