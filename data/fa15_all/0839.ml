
let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n' -> (digitsOfInt (n / 10)) :: (n' mod 10));;


(* fix

let modulus ss = ss mod 10;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n' -> (digitsOfInt (n / 10)) @ [modulus n']);;

*)

(* changed spans
(2,20)-(5,67)
fun ss -> ss mod 10
LamG (BopG EmptyG EmptyG)

(5,29)-(5,66)
digitsOfInt (n / 10) @ [modulus n']
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
Lam (Just (2,12)-(2,26)) (VarPat (Just (2,12)-(2,14)) "ss") (Bop (Just (2,17)-(2,26)) Mod (Var (Just (2,17)-(2,19)) "ss") (Lit (Just (2,24)-(2,26)) (LI 10))) Nothing
App (Just (7,29)-(7,66)) (Var (Just (7,52)-(7,53)) "@") [App (Just (7,29)-(7,51)) (Var (Just (7,30)-(7,41)) "digitsOfInt") [Bop (Just (7,42)-(7,50)) Div (Var (Just (7,43)-(7,44)) "n") (Lit (Just (7,47)-(7,49)) (LI 10))],List (Just (7,54)-(7,66)) [App (Just (7,55)-(7,65)) (Var (Just (7,55)-(7,62)) "modulus") [Var (Just (7,63)-(7,65)) "n'"]] Nothing]
*)

(* typed spans
(2,12)-(2,26)
(7,29)-(7,66)
*)

(* correct types
int -> int
int list
*)

(* bad types
int -> 'a list
'a list
*)
