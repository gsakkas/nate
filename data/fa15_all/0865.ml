
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
      else (l1, ((clone 0 n) @ l2));;

*)

(* changed spans
(11,11)-(11,44)
(l1 , clone 0 n @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (11,11)-(11,35)) [Var (Just (11,12)-(11,14)) "l1",App (Just (11,16)-(11,34)) (Var (Just (11,29)-(11,30)) "@") [App (Just (11,17)-(11,28)) (Var (Just (11,18)-(11,23)) "clone") [Lit (Just (11,24)-(11,25)) (LI 0),Var (Just (11,26)-(11,27)) "n"],Var (Just (11,31)-(11,33)) "l2"]]
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
