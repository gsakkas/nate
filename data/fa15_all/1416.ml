
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> t + (digitalRoot (sumList h));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> h + (digitalRoot (sumList t));;

*)

(* changed spans
(10,45)-(10,46)
h
VarG

(10,71)-(10,72)
t
VarG

*)

(* changed exprs
Var (Just (10,45)-(10,46)) "h"
Var (Just (10,71)-(10,72)) "t"
*)

(* typed spans
(10,45)-(10,46)
(10,71)-(10,72)
*)

(* correct types
int
int list
*)

(* bad types
int list list
int list
*)
