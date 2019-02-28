
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> digitalRoot (digits (sumList n));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec digitalRoot n = match digits n with | x::[] -> x;;

*)

(* changed spans
(10,2)-(10,77)
match digits n with
| x :: [] -> x
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,VarG)])

*)

(* changed exprs
Case (Just (7,24)-(7,56)) (App (Just (7,30)-(7,38)) (Var (Just (7,30)-(7,36)) "digits") [Var (Just (7,37)-(7,38)) "n"]) [(ConsPat (Just (7,46)-(7,51)) (VarPat (Just (7,46)-(7,47)) "x") (ConPat (Just (7,49)-(7,51)) "[]" Nothing),Nothing,Var (Just (7,55)-(7,56)) "x")]
*)

(* typed spans
(7,24)-(7,56)
*)

(* correct types
int
*)

(* bad types
int
*)
