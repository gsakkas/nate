
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let y = List.hd l2 in
      List.combine (let (one,two) = a in ((x :: one), (y :: two))) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let y = List.hd l2 in let (one,two) = a in ((x :: one), (y :: two)) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,6)-(21,66)
let (one , two) = a in
(x :: one , y :: two)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (20,28)-(20,73)) NonRec [(TuplePat (Just (20,33)-(20,40)) [VarPat (Just (20,33)-(20,36)) "one",VarPat (Just (20,37)-(20,40)) "two"],Var (Just (20,44)-(20,45)) "a")] (Tuple (Just (20,49)-(20,73)) [ConApp (Just (20,50)-(20,60)) "::" (Just (Tuple (Just (20,51)-(20,59)) [Var (Just (20,51)-(20,52)) "x",Var (Just (20,56)-(20,59)) "one"])) Nothing,ConApp (Just (20,62)-(20,72)) "::" (Just (Tuple (Just (20,63)-(20,71)) [Var (Just (20,63)-(20,64)) "y",Var (Just (20,68)-(20,71)) "two"])) Nothing])
*)

(* typed spans
(20,28)-(20,73)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list)
*)
