
let rec digitsOfInt n =
  if n != 0
  then
    (if n > 0
     then (digitsOfInt (n / 10)) @ [n mod 10]
     else (digitsOfInt n) * (-1))
  else [];;


(* fix

let rec digitsOfInt n =
  if n != 0
  then
    (if n > 0
     then (digitsOfInt (n / 10)) @ [n mod 10]
     else digitsOfInt (n * (-1)))
  else [];;

*)

(* changed spans
(7,10)-(7,32)
digitsOfInt (n * (-1))
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (7,10)-(7,32)) (Var (Just (7,10)-(7,21)) "digitsOfInt") [Bop (Just (7,22)-(7,32)) Times (Var (Just (7,23)-(7,24)) "n") (Lit (Just (7,27)-(7,31)) (LI (-1)))]
*)

(* typed spans
(7,10)-(7,32)
*)

(* correct types
int list
*)

(* bad types
int
*)
