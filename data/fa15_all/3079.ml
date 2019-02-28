
let rec listReverse l =
  let rec listReverseHelper l =
    match l with | [] -> l | h::t -> listReverseHelper (h :: l) t in
  listReverseHelper [] l;;


(* fix

let rec listReverse l =
  let rec listReverseHelper l =
    function | [] -> l | h::t -> listReverseHelper (h :: l) t in
  listReverseHelper [] l;;

*)

(* changed spans
(4,4)-(4,65)
function
  | [] -> l
  | h :: t -> listReverseHelper (h :: l)
                                t
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Lam (Just (4,4)-(4,61)) (VarPat (Just (4,4)-(4,61)) "$x") (Case (Just (4,4)-(4,61)) (Var (Just (4,4)-(4,61)) "$x") [(ConPat (Just (4,15)-(4,17)) "[]" Nothing,Nothing,Var (Just (4,21)-(4,22)) "l"),(ConsPat (Just (4,25)-(4,29)) (VarPat (Just (4,25)-(4,26)) "h") (VarPat (Just (4,28)-(4,29)) "t"),Nothing,App (Just (4,33)-(4,61)) (Var (Just (4,33)-(4,50)) "listReverseHelper") [ConApp (Just (4,51)-(4,59)) "::" (Just (Tuple (Just (4,52)-(4,58)) [Var (Just (4,52)-(4,53)) "h",Var (Just (4,57)-(4,58)) "l"])) Nothing,Var (Just (4,60)-(4,61)) "t"])]) Nothing
*)

(* typed spans
(4,4)-(4,61)
*)

(* correct types
'a list -> 'a list
*)

(* bad types
'a list
*)
