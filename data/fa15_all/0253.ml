
let mult (x,y) = x * y;;

let bigMul l1 l2 =
  let f a x =
    let (m,n) = x in
    let (y,z) = a in
    ((((mult (m, n)) + y) / 10), [((mult (m, n)) + y) mod 10]) @ z in
  let base = (0, []) in
  let args = List.rev (List.combine l1 l2) in
  let (cin,res) = List.fold_left f base args in [cin] @ res;;


(* fix

let mult (x,y) = x * y;;

let bigMul l1 l2 =
  let f a x =
    let (m,n) = x in
    let (y,z) = a in
    ((((mult (m, n)) + y) / 10), ([((mult (m, n)) + y) mod 10] @ z)) in
  let base = (0, []) in
  let args = List.rev (List.combine l1 l2) in
  let (cin,res) = List.fold_left f base args in [cin] @ res;;

*)

(* changed spans
(8,4)-(8,66)
EMPTY
EmptyG

(8,33)-(8,61)
[(mult (m , n) + y) mod 10] @ z
AppG (fromList [VarG,ListG EmptyG Nothing])

(8,63)-(8,64)
EMPTY
EmptyG

*)
