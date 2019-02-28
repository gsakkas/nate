
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in d :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10
    then [n]
    else (let d::[] = digitsOfInt (n / 10) in [d; n mod 10]);;

*)

(* changed spans
(6,28)-(6,77)
let d :: [] =
  digitsOfInt (n / 10) in
[d ; n mod 10]
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (ListG EmptyG)

*)

(* changed exprs
Let (Just (8,9)-(8,60)) NonRec [(ConsPat (Just (8,14)-(8,19)) (VarPat (Just (8,14)-(8,15)) "d") (ConPat (Just (8,17)-(8,19)) "[]" Nothing),App (Just (8,22)-(8,42)) (Var (Just (8,22)-(8,33)) "digitsOfInt") [Bop (Just (8,34)-(8,42)) Div (Var (Just (8,35)-(8,36)) "n") (Lit (Just (8,39)-(8,41)) (LI 10))])] (List (Just (8,46)-(8,59)) [Var (Just (8,47)-(8,48)) "d",Bop (Just (8,50)-(8,58)) Mod (Var (Just (8,50)-(8,51)) "n") (Lit (Just (8,56)-(8,58)) (LI 10))] Nothing)
*)

(* typed spans
(8,9)-(8,60)
*)

(* correct types
int list
*)

(* bad types
int list
*)
