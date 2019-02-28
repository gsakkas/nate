
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1 * (clone 0 d)) @ l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

*)

(* changed spans
(6,52)-(6,75)
(l1 , clone 0 d @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (6,52)-(6,76)) [Var (Just (6,53)-(6,55)) "l1",App (Just (6,57)-(6,75)) (Var (Just (6,70)-(6,71)) "@") [App (Just (6,58)-(6,69)) (Var (Just (6,59)-(6,64)) "clone") [Lit (Just (6,65)-(6,66)) (LI 0),Var (Just (6,67)-(6,68)) "d"],Var (Just (6,72)-(6,74)) "l2"]]
*)

(* typed spans
(6,52)-(6,76)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * 'a list)
*)
