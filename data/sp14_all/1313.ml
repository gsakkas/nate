
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
EMPTY
EmptyG

(4,20)-(4,21)
EMPTY
EmptyG

(6,4)-(6,58)
EMPTY
EmptyG

(6,10)-(6,13)
EMPTY
EmptyG

(6,27)-(6,29)
EMPTY
EmptyG

(6,41)-(6,50)
EMPTY
EmptyG

(6,48)-(6,49)
EMPTY
EmptyG

(6,52)-(6,57)
l2
VarG

(8,13)-(8,43)
EMPTY
EmptyG

(8,29)-(8,42)
EMPTY
EmptyG

(8,30)-(8,38)
EMPTY
EmptyG

(8,39)-(8,41)
EMPTY
EmptyG

*)
