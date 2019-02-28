
let rec digitsOfInt n =
  if n < 0
  then []
  else (fun n  -> let d = digitsOfInt (n / 10) in (n mod 10) :: d);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let d = digitsOfInt (n / 10) in (n mod 10) :: d);;

*)

(* changed spans
(5,7)-(5,66)
let d =
  digitsOfInt (n / 10) in
(n mod 10) :: d
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (ConAppG (Just EmptyG))

*)

(* changed exprs
Let (Just (3,24)-(3,73)) NonRec [(VarPat (Just (3,29)-(3,30)) "d",App (Just (3,33)-(3,53)) (Var (Just (3,33)-(3,44)) "digitsOfInt") [Bop (Just (3,45)-(3,53)) Div (Var (Just (3,46)-(3,47)) "n") (Lit (Just (3,50)-(3,52)) (LI 10))])] (ConApp (Just (3,57)-(3,72)) "::" (Just (Tuple (Just (3,57)-(3,72)) [Bop (Just (3,57)-(3,67)) Mod (Var (Just (3,58)-(3,59)) "n") (Lit (Just (3,64)-(3,66)) (LI 10)),Var (Just (3,71)-(3,72)) "d"])) Nothing)
*)

(* typed spans
(3,24)-(3,73)
*)

(* correct types
int list
*)

(* bad types
int -> int list
*)
