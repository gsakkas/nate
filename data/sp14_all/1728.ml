
let rec digitsOfInt n =
  if n <= 0 then [] else (let n10 = n / 10 in [digitsOfInt n10; n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (let n10 = n / 10 in [n mod 10] @ (digitsOfInt n10));;

*)

(* changed spans
(3,46)-(3,73)
[n mod 10] @ digitsOfInt n10
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,46)-(3,76)) (Var (Just (3,57)-(3,58)) "@") [List (Just (3,46)-(3,56)) [Bop (Just (3,47)-(3,55)) Mod (Var (Just (3,47)-(3,48)) "n") (Lit (Just (3,53)-(3,55)) (LI 10))] Nothing,App (Just (3,59)-(3,76)) (Var (Just (3,60)-(3,71)) "digitsOfInt") [Var (Just (3,72)-(3,75)) "n10"]]
*)

(* typed spans
(3,46)-(3,76)
*)

(* correct types
int list
*)

(* bad types
int list
*)
