
let rec digitsOfInt n =
  if n < 0
  then []
  else (let a = n / 10 in let b = n mod 10 in (digitsOfInt a) :: b);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (let a = n / 10 in let b = n mod 10 in let c = [a; b] in c);;

*)

(* changed spans
(5,46)-(5,66)
let c = [a ; b] in c
LetG NonRec (fromList [ListG EmptyG]) VarG

*)

(* changed exprs
Let (Just (5,46)-(5,65)) NonRec [(VarPat (Just (5,50)-(5,51)) "c",List (Just (5,54)-(5,60)) [Var (Just (5,55)-(5,56)) "a",Var (Just (5,58)-(5,59)) "b"] Nothing)] (Var (Just (5,64)-(5,65)) "c")
*)

(* typed spans
(5,46)-(5,65)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
