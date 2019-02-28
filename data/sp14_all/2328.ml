
let rec clone x n =
  let acc = [] in if n = 0 then acc else (clone x) :: ((acc n) - 1);;


(* fix

let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;

*)

(* changed spans
(3,2)-(3,67)
let accum = [] in
if n < 1
then []
else clone x n
LetG NonRec (fromList [ListG EmptyG]) (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Let (Just (2,20)-(2,69)) NonRec [(VarPat (Just (2,24)-(2,29)) "accum",List (Just (2,32)-(2,34)) [] Nothing)] (Ite (Just (2,38)-(2,69)) (Bop (Just (2,41)-(2,46)) Lt (Var (Just (2,41)-(2,42)) "n") (Lit (Just (2,45)-(2,46)) (LI 1))) (List (Just (2,52)-(2,54)) [] Nothing) (App (Just (2,60)-(2,69)) (Var (Just (2,60)-(2,65)) "clone") [Var (Just (2,66)-(2,67)) "x",Var (Just (2,68)-(2,69)) "n"]))
*)

(* typed spans
(2,20)-(2,69)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
