
let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y =
    if x < 10 then y else loop ((sumList (digitsOfInt x)) + y) in
  match n with | 0 -> 0 | x' -> loop x' 0;;


(* fix

let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y = if x < 10 then y else (sumList (digitsOfInt x)) + y in
  match n with | 0 -> 0 | x' -> loop x' 0;;

*)

(* changed spans
(11,26)-(11,62)
sumList (digitsOfInt x) + y
BopG (AppG (fromList [EmptyG])) VarG

*)

(* changed exprs
Bop (Just (10,43)-(10,72)) Plus (App (Just (10,43)-(10,68)) (Var (Just (10,44)-(10,51)) "sumList") [App (Just (10,52)-(10,67)) (Var (Just (10,53)-(10,64)) "digitsOfInt") [Var (Just (10,65)-(10,66)) "x"]]) (Var (Just (10,71)-(10,72)) "y")
*)

(* typed spans
(10,43)-(10,72)
*)

(* correct types
int
*)

(* bad types
int
*)
