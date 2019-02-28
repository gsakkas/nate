
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,46)-(3,62)
[] @ [n mod 10]
AppG (fromList [ListG EmptyG])

*)

(* changed exprs
App (Just (3,46)-(3,61)) (Var (Just (3,49)-(3,50)) "@") [List (Just (3,46)-(3,48)) [] Nothing,List (Just (3,51)-(3,61)) [Bop (Just (3,52)-(3,60)) Mod (Var (Just (3,52)-(3,53)) "n") (Lit (Just (3,58)-(3,60)) (LI 10))] Nothing]
*)

(* typed spans
(3,46)-(3,61)
*)

(* correct types
int list
*)

(* bad types
'a list list
*)
