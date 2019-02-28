
let bigMul l1 l2 =
  let f a x =
    let (val1,val2) = x in
    let (lastCarry,lastTupleMult) = a in
    let tupleMult = (val1 * val2) + lastCarry in
    let newCarry = tupleMult / 10 in
    let nextDigit = tupleMult mod 10 in
    (newCarry, (nextDigit :: lastTupleMult)) in
  let base = (1, []) in
  let args = List.rev ((List.combine 0) :: (l1 0) :: l2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x =
    let (val1,val2) = x in
    let (lastCarry,lastTupleMult) = a in
    let tupleMult = (val1 * val2) + lastCarry in
    let newCarry = tupleMult / 10 in
    let nextDigit = tupleMult mod 10 in
    (newCarry, (nextDigit :: lastTupleMult)) in
  let base = (1, []) in
  let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(11,22)-(11,56)
List.combine (0 :: l1)
             (0 :: l2)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG,LitG])))])

(11,37)-(11,38)
EMPTY
EmptyG

(11,43)-(11,49)
0
LitG

(11,47)-(11,48)
0 :: l2
ConAppG (Just (TupleG (fromList [VarG,LitG])))

*)

(* typed spans
(11,22)-(11,56)
(11,37)-(11,38)
(11,46)-(11,55)
*)

(* typed spans
(int * int) list
int
int list
*)

(* typed spans
(int * int) list
(int * int)
int
*)
