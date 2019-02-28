
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,38)-(5,74)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (5,38)-(5,73)) (Var (Just (5,61)-(5,62)) "@") [App (Just (5,38)-(5,60)) (Var (Just (5,39)-(5,50)) "digitsOfInt") [Bop (Just (5,51)-(5,59)) Div (Var (Just (5,52)-(5,53)) "n") (Lit (Just (5,56)-(5,58)) (LI 10))],List (Just (5,63)-(5,73)) [Bop (Just (5,64)-(5,72)) Mod (Var (Just (5,64)-(5,65)) "n") (Lit (Just (5,70)-(5,72)) (LI 10))] Nothing]
*)

(* typed spans
(5,38)-(5,73)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
