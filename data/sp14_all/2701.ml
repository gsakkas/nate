
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec additivePersistence n =
  match n with | [] -> [] | h::t -> t + (digitsOfInt (additivePersistence h));;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else 1 + (additivePersistence (sumList (digitsOfInt n)));;

*)

(* changed spans
(5,28)-(6,77)
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(6,53)-(6,76)
fun n ->
  if n < 10
  then 1
  else 1 + additivePersistence (sumList (digitsOfInt n))
LamG (IteG EmptyG EmptyG EmptyG)

(6,74)-(6,75)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (5,16)-(5,70)) (VarPat (Just (5,16)-(5,18)) "xs") (Case (Just (5,21)-(5,70)) (Var (Just (5,27)-(5,29)) "xs") [(ConPat (Just (5,37)-(5,39)) "[]" Nothing,Nothing,Lit (Just (5,43)-(5,44)) (LI 0)),(ConsPat (Just (5,47)-(5,51)) (VarPat (Just (5,47)-(5,48)) "h") (VarPat (Just (5,50)-(5,51)) "t"),Nothing,Bop (Just (5,55)-(5,70)) Plus (Var (Just (5,55)-(5,56)) "h") (App (Just (5,59)-(5,70)) (Var (Just (5,60)-(5,67)) "sumList") [Var (Just (5,68)-(5,69)) "t"]))]) Nothing
Lam (Just (7,28)-(8,75)) (VarPat (Just (7,28)-(7,29)) "n") (Ite (Just (8,2)-(8,75)) (Bop (Just (8,5)-(8,11)) Lt (Var (Just (8,5)-(8,6)) "n") (Lit (Just (8,9)-(8,11)) (LI 10))) (Lit (Just (8,17)-(8,18)) (LI 1)) (Bop (Just (8,24)-(8,75)) Plus (Lit (Just (8,24)-(8,25)) (LI 1)) (App (Just (8,28)-(8,75)) (Var (Just (8,29)-(8,48)) "additivePersistence") [App (Just (8,49)-(8,74)) (Var (Just (8,50)-(8,57)) "sumList") [App (Just (8,58)-(8,73)) (Var (Just (8,59)-(8,70)) "digitsOfInt") [Var (Just (8,71)-(8,72)) "n"]]]))) Nothing
App (Just (8,49)-(8,74)) (Var (Just (8,50)-(8,57)) "sumList") [App (Just (8,58)-(8,73)) (Var (Just (8,59)-(8,70)) "digitsOfInt") [Var (Just (8,71)-(8,72)) "n"]]
*)

(* typed spans
(5,16)-(5,70)
(7,28)-(8,75)
(8,49)-(8,74)
*)

(* correct types
int list -> int
int -> int
int
*)

(* bad types
'a list -> 'b list
int
'a
*)
