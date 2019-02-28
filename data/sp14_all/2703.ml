
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let sum = 0 in
  if n < 10 then n + sum else sum = (digitalRoot (sumList (digitsOfInt n)));;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let sum = 0 in if n < 10 then n else digitalRoot (sumList (digitsOfInt n));;

*)

(* changed spans
(9,17)-(9,24)
n
VarG

(9,30)-(9,75)
digitalRoot (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

(9,30)-(9,75)
digitalRoot
VarG

(9,30)-(9,75)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

(9,30)-(9,75)
sumList
VarG

(9,30)-(9,75)
digitsOfInt n
AppG (fromList [VarG])

(9,30)-(9,75)
digitsOfInt
VarG

(9,30)-(9,75)
n
VarG

*)

(* changed exprs
Var (Just (8,32)-(8,33)) "n"
App (Just (8,39)-(8,76)) (Var (Just (8,39)-(8,50)) "digitalRoot") [App (Just (8,51)-(8,76)) (Var (Just (8,52)-(8,59)) "sumList") [App (Just (8,60)-(8,75)) (Var (Just (8,61)-(8,72)) "digitsOfInt") [Var (Just (8,73)-(8,74)) "n"]]]
Var (Just (8,39)-(8,50)) "digitalRoot"
App (Just (8,51)-(8,76)) (Var (Just (8,52)-(8,59)) "sumList") [App (Just (8,60)-(8,75)) (Var (Just (8,61)-(8,72)) "digitsOfInt") [Var (Just (8,73)-(8,74)) "n"]]
Var (Just (8,52)-(8,59)) "sumList"
App (Just (8,60)-(8,75)) (Var (Just (8,61)-(8,72)) "digitsOfInt") [Var (Just (8,73)-(8,74)) "n"]
Var (Just (8,61)-(8,72)) "digitsOfInt"
Var (Just (8,73)-(8,74)) "n"
*)

(* typed spans
(8,32)-(8,33)
(8,39)-(8,76)
(8,39)-(8,50)
(8,51)-(8,76)
(8,52)-(8,59)
(8,60)-(8,75)
(8,61)-(8,72)
(8,73)-(8,74)
*)

(* correct types
int
int
int -> int
int
int list -> int
int list
int -> int list
int
*)

(* bad types
int
bool
bool
bool
bool
bool
bool
bool
*)
