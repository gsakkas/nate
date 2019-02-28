
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0
  then (l1, (List.append (clone 0 a) l2))
  else ((List.append (clone 0 (0 - a))), l2);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0
  then (l1, (List.append (clone 0 a) l2))
  else ((List.append (clone 0 (0 - a)) l1), l2);;

*)

(* changed spans
(8,8)-(8,39)
List.append (clone 0 (0 - a))
            l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (8,8)-(8,42)) (Var (Just (8,9)-(8,20)) "List.append") [App (Just (8,21)-(8,38)) (Var (Just (8,22)-(8,27)) "clone") [Lit (Just (8,28)-(8,29)) (LI 0),Bop (Just (8,30)-(8,37)) Minus (Lit (Just (8,31)-(8,32)) (LI 0)) (Var (Just (8,35)-(8,36)) "a")],Var (Just (8,39)-(8,41)) "l1"]
*)

(* typed spans
(8,8)-(8,42)
*)

(* correct types
int list
*)

(* bad types
int list -> int list
*)
