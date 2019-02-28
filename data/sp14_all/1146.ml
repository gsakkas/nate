
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n == 0
    then [0]
    else
      if (n / 10) == 0 then n mod 10 else (digitsOfInt (n / 10)) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n == 0
    then [0]
    else
      if (n / 10) == 0
      then [n mod 10]
      else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(9,28)-(9,36)
[n mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (10,11)-(10,21)) [Bop (Just (10,12)-(10,20)) Mod (Var (Just (10,12)-(10,13)) "n") (Lit (Just (10,18)-(10,20)) (LI 10))] Nothing
*)

(* typed spans
(10,11)-(10,21)
*)

(* correct types
int list
*)

(* bad types
int
*)
