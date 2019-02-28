
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) @ [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digit = digitsOfInt (n / 10) in digit @ [n mod 10]);;

*)

(* changed spans
(3,25)-(3,60)
let digit =
  digitsOfInt (n / 10) in
digit @ [n mod 10]
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (5,7)-(5,63)) NonRec [(VarPat (Just (5,12)-(5,17)) "digit",App (Just (5,20)-(5,40)) (Var (Just (5,20)-(5,31)) "digitsOfInt") [Bop (Just (5,32)-(5,40)) Div (Var (Just (5,33)-(5,34)) "n") (Lit (Just (5,37)-(5,39)) (LI 10))])] (App (Just (5,44)-(5,62)) (Var (Just (5,50)-(5,51)) "@") [Var (Just (5,44)-(5,49)) "digit",List (Just (5,52)-(5,62)) [Bop (Just (5,53)-(5,61)) Mod (Var (Just (5,53)-(5,54)) "n") (Lit (Just (5,59)-(5,61)) (LI 10))] Nothing])
*)

(* typed spans
(5,7)-(5,63)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
