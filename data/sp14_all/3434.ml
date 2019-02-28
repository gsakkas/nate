
let rec sumList xs =
  if (List.length xs) != 0 then (xs.(0)) + (sumList (List.hd xs));;


(* fix

let rec sumList xs = let x::t = xs in x + (sumList t);;

*)

(* changed spans
(3,2)-(3,65)
let x :: t = xs in
x + sumList t
LetG NonRec (fromList [VarG]) (BopG EmptyG EmptyG)

*)

(* changed exprs
Let (Just (2,21)-(2,53)) NonRec [(ConsPat (Just (2,25)-(2,29)) (VarPat (Just (2,25)-(2,26)) "x") (VarPat (Just (2,28)-(2,29)) "t"),Var (Just (2,32)-(2,34)) "xs")] (Bop (Just (2,38)-(2,53)) Plus (Var (Just (2,38)-(2,39)) "x") (App (Just (2,42)-(2,53)) (Var (Just (2,43)-(2,50)) "sumList") [Var (Just (2,51)-(2,52)) "t"]))
*)

(* typed spans
(2,21)-(2,53)
*)

(* correct types
int
*)

(* bad types
unit
*)
