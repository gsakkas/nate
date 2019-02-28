
let rec clone x n = List.split x n;;


(* fix

let rec cloneHelper x n = if x <= 0 then [] else cloneHelper x (n - 1);;

let rec clone x n = cloneHelper x n;;

*)

(* changed spans
(2,20)-(2,34)
if x <= 0
then []
else cloneHelper x (n - 1)
IteG (BopG EmptyG EmptyG) (ListG EmptyG) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Ite (Just (2,26)-(2,70)) (Bop (Just (2,29)-(2,35)) Le (Var (Just (2,29)-(2,30)) "x") (Lit (Just (2,34)-(2,35)) (LI 0))) (List (Just (2,41)-(2,43)) [] Nothing) (App (Just (2,49)-(2,70)) (Var (Just (2,49)-(2,60)) "cloneHelper") [Var (Just (2,61)-(2,62)) "x",Bop (Just (2,63)-(2,70)) Minus (Var (Just (2,64)-(2,65)) "n") (Lit (Just (2,68)-(2,69)) (LI 1))])
*)

(* typed spans
(2,26)-(2,70)
*)

(* correct types
'a list
*)

(* bad types
'a
*)
