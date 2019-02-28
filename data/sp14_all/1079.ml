
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper (x, (n - 1), (x :: acc)) in
  cloneHelper x n [];;


(* fix

let rec clone x n =
  let rec cloneHelper (x,n,acc) =
    if n < 0 then acc else cloneHelper (x, (n - 1), (x :: acc)) in
  cloneHelper (x, n, []);;

*)

(* changed spans
(3,22)-(4,63)
fun (x , n , acc) ->
  if n < 0
  then acc
  else cloneHelper (x , n - 1 , x :: acc)
LamG (IteG EmptyG EmptyG EmptyG)

(5,2)-(5,20)
cloneHelper (x , n , [])
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (3,23)-(4,63)) (TuplePat (Just (3,23)-(3,30)) [VarPat (Just (3,23)-(3,24)) "x",VarPat (Just (3,25)-(3,26)) "n",VarPat (Just (3,27)-(3,30)) "acc"]) (Ite (Just (4,4)-(4,63)) (Bop (Just (4,7)-(4,12)) Lt (Var (Just (4,7)-(4,8)) "n") (Lit (Just (4,11)-(4,12)) (LI 0))) (Var (Just (4,18)-(4,21)) "acc") (App (Just (4,27)-(4,63)) (Var (Just (4,27)-(4,38)) "cloneHelper") [Tuple (Just (4,39)-(4,63)) [Var (Just (4,40)-(4,41)) "x",Bop (Just (4,43)-(4,50)) Minus (Var (Just (4,44)-(4,45)) "n") (Lit (Just (4,48)-(4,49)) (LI 1)),ConApp (Just (4,52)-(4,62)) "::" (Just (Tuple (Just (4,53)-(4,61)) [Var (Just (4,53)-(4,54)) "x",Var (Just (4,58)-(4,61)) "acc"])) Nothing]])) Nothing
App (Just (5,2)-(5,24)) (Var (Just (5,2)-(5,13)) "cloneHelper") [Tuple (Just (5,14)-(5,24)) [Var (Just (5,15)-(5,16)) "x",Var (Just (5,18)-(5,19)) "n",List (Just (5,21)-(5,23)) [] Nothing]]
*)

(* typed spans
(3,23)-(4,63)
(5,2)-(5,24)
*)

(* correct types
('a * int * 'a list) -> 'a list
'a list
*)

(* bad types
'a -> int -> 'a list -> 'a list
'a
*)
