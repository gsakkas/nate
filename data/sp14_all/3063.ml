
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n = let l = [] in if n < 0 then l else l;;

*)

(* changed spans
(2,24)-(2,40)
let l = [] in
if n < 0 then l else l
LetG NonRec (fromList [ListG EmptyG]) (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Let (Just (2,24)-(2,60)) NonRec [(VarPat (Just (2,28)-(2,29)) "l",List (Just (2,32)-(2,34)) [] Nothing)] (Ite (Just (2,38)-(2,60)) (Bop (Just (2,41)-(2,46)) Lt (Var (Just (2,41)-(2,42)) "n") (Lit (Just (2,45)-(2,46)) (LI 0))) (Var (Just (2,52)-(2,53)) "l") (Var (Just (2,59)-(2,60)) "l"))
*)

(* typed spans
(2,24)-(2,60)
*)

(* correct types
'a list
*)

(* bad types
unit
*)
