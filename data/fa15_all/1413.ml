
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> h + (digitalRoot t);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> h + (digitalRoot (sumList t));;

*)

(* changed spans
(7,20)-(8,64)
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(8,62)-(8,63)
sumList t
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (7,16)-(7,70)) (VarPat (Just (7,16)-(7,18)) "xs") (Case (Just (7,21)-(7,70)) (Var (Just (7,27)-(7,29)) "xs") [(ConPat (Just (7,37)-(7,39)) "[]" Nothing,Nothing,Lit (Just (7,43)-(7,44)) (LI 0)),(ConsPat (Just (7,47)-(7,51)) (VarPat (Just (7,47)-(7,48)) "h") (VarPat (Just (7,50)-(7,51)) "t"),Nothing,Bop (Just (7,55)-(7,70)) Plus (Var (Just (7,55)-(7,56)) "h") (App (Just (7,59)-(7,70)) (Var (Just (7,60)-(7,67)) "sumList") [Var (Just (7,68)-(7,69)) "t"]))]) Nothing
App (Just (10,62)-(10,73)) (Var (Just (10,63)-(10,70)) "sumList") [Var (Just (10,71)-(10,72)) "t"]
*)

(* typed spans
(7,16)-(7,70)
(10,62)-(10,73)
*)

(* correct types
int list -> int
int
*)

(* bad types
int -> int
int list
*)
