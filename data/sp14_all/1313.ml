
let bigMul l1 l2 =
  let f a x =
    let (l1',l2') = x in
    let (pos,total) = a in
    match l2' with | [] -> [] | h::t -> ((pos + 1), total) in
  let base = (0, [0]) in
  let args = ((List.rev l1), (List.rev l2)) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x = let (pos,total) = a in (pos, l2) in
  let base = (0, [0]) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(4,4)-(6,58)
let (pos , total) = a in
(pos , l2)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(8,13)-(8,43)
List.rev l1
AppG (fromList [VarG])

(8,13)-(8,43)
List.rev
VarG

(8,13)-(8,43)
l1
VarG

*)

(* changed exprs
Let (Just (3,14)-(3,46)) NonRec [(TuplePat (Just (3,19)-(3,28)) [VarPat (Just (3,19)-(3,22)) "pos",VarPat (Just (3,23)-(3,28)) "total"],Var (Just (3,32)-(3,33)) "a")] (Tuple (Just (3,37)-(3,46)) [Var (Just (3,38)-(3,41)) "pos",Var (Just (3,43)-(3,45)) "l2"])
App (Just (5,13)-(5,24)) (Var (Just (5,13)-(5,21)) "List.rev") [Var (Just (5,22)-(5,24)) "l1"]
Var (Just (5,13)-(5,21)) "List.rev"
Var (Just (5,22)-(5,24)) "l1"
*)

(* typed spans
(3,14)-(3,46)
(5,13)-(5,24)
(5,13)-(5,21)
(5,22)-(5,24)
*)

(* correct types
(int * int list)
'a list
'a list -> 'a list
'a list
*)

(* bad types
'a list
('a list * 'b list)
('a list * 'b list)
('a list * 'b list)
*)
