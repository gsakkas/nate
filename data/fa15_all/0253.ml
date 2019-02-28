
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
((mult (m , n) + y) / 10 , [(mult (m , n) + y) mod 10] @ z)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
Tuple (Just (8,4)-(8,68)) [Bop (Just (8,5)-(8,31)) Div (Bop (Just (8,6)-(8,25)) Plus (App (Just (8,7)-(8,20)) (Var (Just (8,8)-(8,12)) "mult") [Tuple (Just (8,13)-(8,19)) [Var (Just (8,14)-(8,15)) "m",Var (Just (8,17)-(8,18)) "n"]]) (Var (Just (8,23)-(8,24)) "y")) (Lit (Just (8,28)-(8,30)) (LI 10)),App (Just (8,33)-(8,67)) (Var (Just (8,63)-(8,64)) "@") [List (Just (8,34)-(8,62)) [Bop (Just (8,35)-(8,61)) Mod (Bop (Just (8,35)-(8,54)) Plus (App (Just (8,36)-(8,49)) (Var (Just (8,37)-(8,41)) "mult") [Tuple (Just (8,42)-(8,48)) [Var (Just (8,43)-(8,44)) "m",Var (Just (8,46)-(8,47)) "n"]]) (Var (Just (8,52)-(8,53)) "y")) (Lit (Just (8,59)-(8,61)) (LI 10))] Nothing,Var (Just (8,65)-(8,66)) "z"]]
*)

(* typed spans
(8,4)-(8,68)
*)

(* correct types
(int * int list)
*)

(* bad types
(int * int list)
*)
