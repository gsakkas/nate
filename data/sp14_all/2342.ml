
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if true then List.append (clone 0 1) l1;;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

*)

(* changed spans
(10,5)-(10,9)
a < b
BopG VarG VarG

(10,15)-(10,41)
(List.append (clone 0 (b - a))
             l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,36)-(10,37)
b - a
BopG VarG VarG

(10,2)-(10,41)
l2
VarG

*)

(* changed exprs
Bop (Just (10,5)-(10,10)) Lt (Var (Just (10,5)-(10,6)) "a") (Var (Just (10,9)-(10,10)) "b")
Tuple (Just (11,7)-(11,47)) [App (Just (11,8)-(11,42)) (Var (Just (11,9)-(11,20)) "List.append") [App (Just (11,21)-(11,38)) (Var (Just (11,22)-(11,27)) "clone") [Lit (Just (11,28)-(11,29)) (LI 0),Bop (Just (11,30)-(11,37)) Minus (Var (Just (11,31)-(11,32)) "b") (Var (Just (11,35)-(11,36)) "a")],Var (Just (11,39)-(11,41)) "l1"],Var (Just (11,44)-(11,46)) "l2"]
Bop (Just (11,30)-(11,37)) Minus (Var (Just (11,31)-(11,32)) "b") (Var (Just (11,35)-(11,36)) "a")
Var (Just (11,44)-(11,46)) "l2"
*)

(* typed spans
(10,5)-(10,10)
(11,7)-(11,47)
(11,30)-(11,37)
(11,44)-(11,46)
*)

(* correct types
bool
(int list * int list)
int
int list
*)

(* bad types
bool
int list
int
unit
*)
