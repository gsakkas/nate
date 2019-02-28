
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (clone 0 z) :: y
  else (let z = y - x in (clone 0 z) :: x);;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

*)

(* changed spans
(9,24)-(9,40)
(l1 , clone 0 z @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,25)-(10,41)
(clone 0 z @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Tuple (Just (9,24)-(9,48)) [Var (Just (9,25)-(9,27)) "l1",App (Just (9,29)-(9,47)) (Var (Just (9,42)-(9,43)) "@") [App (Just (9,30)-(9,41)) (Var (Just (9,31)-(9,36)) "clone") [Lit (Just (9,37)-(9,38)) (LI 0),Var (Just (9,39)-(9,40)) "z"],Var (Just (9,44)-(9,46)) "l2"]]
Tuple (Just (10,25)-(10,49)) [App (Just (10,26)-(10,44)) (Var (Just (10,39)-(10,40)) "@") [App (Just (10,27)-(10,38)) (Var (Just (10,28)-(10,33)) "clone") [Lit (Just (10,34)-(10,35)) (LI 0),Var (Just (10,36)-(10,37)) "z"],Var (Just (10,41)-(10,43)) "l1"],Var (Just (10,46)-(10,48)) "l2"]
*)

(* typed spans
(9,24)-(9,48)
(10,25)-(10,49)
*)

(* correct types
(int list * int list)
(int list * int list)
*)

(* bad types
int list list
int list list
*)
