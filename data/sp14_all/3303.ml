
let bigMul l1 l2 =
  let f a x = ([0], [x]) in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x = match x with | (k,v) -> ([k], v) in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(3,14)-(3,24)
match x with
| (k , v) -> ([k] , v)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (3,14)-(3,46)) (Var (Just (3,20)-(3,21)) "x") [(TuplePat (Just (3,30)-(3,33)) [VarPat (Just (3,30)-(3,31)) "k",VarPat (Just (3,32)-(3,33)) "v"],Nothing,Tuple (Just (3,38)-(3,46)) [List (Just (3,39)-(3,42)) [Var (Just (3,40)-(3,41)) "k"] Nothing,Var (Just (3,44)-(3,45)) "v"])]
*)

(* typed spans
(3,14)-(3,46)
*)

(* correct types
(int list * int list)
*)

(* bad types
(int list * int list)
*)
