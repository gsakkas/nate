
let rec digitsOfInt n = match n with | [] -> [] | n -> if n > 0 then 0;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [];;

*)

(* changed spans
(2,24)-(2,70)
if n < 0 then [] else []
IteG (BopG EmptyG EmptyG) (ListG EmptyG) (ListG EmptyG)

*)

(* changed exprs
Ite (Just (2,24)-(2,48)) (Bop (Just (2,27)-(2,32)) Lt (Var (Just (2,27)-(2,28)) "n") (Lit (Just (2,31)-(2,32)) (LI 0))) (List (Just (2,38)-(2,40)) [] Nothing) (List (Just (2,46)-(2,48)) [] Nothing)
*)

(* typed spans
(2,24)-(2,48)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
