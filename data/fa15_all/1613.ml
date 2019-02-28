
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) :: ([] @ [n mod 10]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,67)
[] @ [n mod 10]
AppG (fromList [ListG EmptyG])

*)

(* changed exprs
App (Just (2,46)-(2,61)) (Var (Just (2,49)-(2,50)) "@") [List (Just (2,46)-(2,48)) [] Nothing,List (Just (2,51)-(2,61)) [Bop (Just (2,52)-(2,60)) Mod (Var (Just (2,52)-(2,53)) "n") (Lit (Just (2,58)-(2,60)) (LI 10))] Nothing]
*)

(* typed spans
(2,46)-(2,61)
*)

(* correct types
int list
*)

(* bad types
int list
*)
