
let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 abs n) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;


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
(10,13)-(10,28)
clone 0 (n * (-1))
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)

(* changed exprs
App (Just (10,13)-(10,33)) (Var (Just (10,14)-(10,19)) "clone") [Lit (Just (10,20)-(10,21)) (LI 0),Bop (Just (10,22)-(10,32)) Times (Var (Just (10,23)-(10,24)) "n") (Lit (Just (10,27)-(10,31)) (LI (-1)))]
*)

(* typed spans
(10,13)-(10,33)
*)

(* correct types
int list
*)

(* bad types
int list
*)
