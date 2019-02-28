
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else x @ (digitsOfInt y));;


(* fix

let rec append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else append x (digitsOfInt y));;

*)

(* changed spans
(2,20)-(7,49)
fun x ->
  fun y ->
    match y with
    | [] -> [x]
    | h :: t -> h :: (append x t)
LamG (LamG EmptyG)

(7,31)-(7,32)
append
VarG

*)

(* changed exprs
Lam (Just (2,15)-(2,73)) (VarPat (Just (2,15)-(2,16)) "x") (Lam (Just (2,17)-(2,73)) (VarPat (Just (2,17)-(2,18)) "y") (Case (Just (2,21)-(2,73)) (Var (Just (2,27)-(2,28)) "y") [(ConPat (Just (2,36)-(2,38)) "[]" Nothing,Nothing,List (Just (2,42)-(2,45)) [Var (Just (2,43)-(2,44)) "x"] Nothing),(ConsPat (Just (2,48)-(2,52)) (VarPat (Just (2,48)-(2,49)) "h") (VarPat (Just (2,51)-(2,52)) "t"),Nothing,ConApp (Just (2,56)-(2,73)) "::" (Just (Tuple (Just (2,56)-(2,73)) [Var (Just (2,56)-(2,57)) "h",App (Just (2,61)-(2,73)) (Var (Just (2,62)-(2,68)) "append") [Var (Just (2,69)-(2,70)) "x",Var (Just (2,71)-(2,72)) "t"]])) Nothing)]) Nothing) Nothing
Var (Just (9,29)-(9,35)) "append"
*)

(* typed spans
(2,15)-(2,73)
(9,29)-(9,35)
*)

(* correct types
int -> int list -> int list
int -> int list -> int list
*)

(* bad types
int -> int list
'a list -> 'a list -> 'a list
*)
