
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else if s1 > s2 then (l1, (clone 0 (s1 - s2))) else clone 0 (s2 - s1);;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2 then (l1, (clone 0 (s1 - s2))) else ((clone 0 (s2 - s1)), l2);;

*)

(* changed spans
(10,54)-(10,71)
(clone 0 (s2 - s1) , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (11,51)-(11,76)) [App (Just (11,52)-(11,71)) (Var (Just (11,53)-(11,58)) "clone") [Lit (Just (11,59)-(11,60)) (LI 0),Bop (Just (11,61)-(11,70)) Minus (Var (Just (11,62)-(11,64)) "s2") (Var (Just (11,67)-(11,69)) "s1")],Var (Just (11,73)-(11,75)) "l2"]
*)

(* typed spans
(11,51)-(11,76)
*)

(* correct types
(int list * int list)
*)

(* bad types
int list
*)
