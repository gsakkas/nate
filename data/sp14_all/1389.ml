
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l2), l2)
  else (l1, ((clone 0 l) :: l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l2), l2)
  else (l1, ((clone 0 l) @ l2));;

*)

(* changed spans
(8,12)-(8,31)
clone 0 l @ l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (8,12)-(8,30)) (Var (Just (8,25)-(8,26)) "@") [App (Just (8,13)-(8,24)) (Var (Just (8,14)-(8,19)) "clone") [Lit (Just (8,20)-(8,21)) (LI 0),Var (Just (8,22)-(8,23)) "l"],Var (Just (8,27)-(8,29)) "l2"]
*)

(* typed spans
(8,12)-(8,30)
*)

(* correct types
int list
*)

(* bad types
int list list
*)
