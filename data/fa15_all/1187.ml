
let rec wwhile (f,b) = match b with | b -> wwhile f b;;


(* fix

let rec wwhile (f,b) =
  match b with | b -> if (f b) = (b, true) then wwhile (f, b);;

*)

(* changed spans
(2,43)-(2,53)
if f b = (b , true)
then wwhile (f , b)
else ()
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (ConAppG Nothing)

*)

(* changed exprs
Ite (Just (3,22)-(3,61)) (Bop (Just (3,25)-(3,42)) Eq (App (Just (3,25)-(3,30)) (Var (Just (3,26)-(3,27)) "f") [Var (Just (3,28)-(3,29)) "b"]) (Tuple (Just (3,33)-(3,42)) [Var (Just (3,34)-(3,35)) "b",Lit (Just (3,37)-(3,41)) (LB True)])) (App (Just (3,48)-(3,61)) (Var (Just (3,48)-(3,54)) "wwhile") [Tuple (Just (3,55)-(3,61)) [Var (Just (3,56)-(3,57)) "f",Var (Just (3,59)-(3,60)) "b"]]) (ConApp (Just (3,22)-(3,61)) "()" Nothing (Just (TApp "unit" [])))
*)

(* typed spans
(3,22)-(3,61)
*)

(* correct types
unit
*)

(* bad types
'a
*)
