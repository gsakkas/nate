
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else List.rev (((clone 0 n) @ l2), l1);;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

*)

(* changed spans
(11,11)-(11,44)
(clone 0 n @ l2 , l1)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (11,11)-(11,35)) [App (Just (11,12)-(11,30)) (Var (Just (11,25)-(11,26)) "@") [App (Just (11,13)-(11,24)) (Var (Just (11,14)-(11,19)) "clone") [Lit (Just (11,20)-(11,21)) (LI 0),Var (Just (11,22)-(11,23)) "n"],Var (Just (11,27)-(11,29)) "l2"],Var (Just (11,32)-(11,34)) "l1"]
*)

(* typed spans
(11,11)-(11,35)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list)
*)
