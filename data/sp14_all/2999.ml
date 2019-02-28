
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 abs diff) @ l1), l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 (abs diff)) @ l1), l2);;

*)

(* changed spans
(8,9)-(8,27)
clone 0 (abs diff)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (8,9)-(8,29)) (Var (Just (8,10)-(8,15)) "clone") [Lit (Just (8,16)-(8,17)) (LI 0),App (Just (8,18)-(8,28)) (Var (Just (8,19)-(8,22)) "abs") [Var (Just (8,23)-(8,27)) "diff"]]
*)

(* typed spans
(8,9)-(8,29)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
