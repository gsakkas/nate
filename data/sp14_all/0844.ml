
let rec listReverse l =
  match l with | [] -> l | (other::tail::[])::[] -> tail :: other;;


(* fix

let rec listReverse l =
  let rec listReverseHelper l ans =
    match ans with | [] -> [] | h::t -> listReverseHelper t (h :: ans) in
  listReverseHelper l [];;

*)

(* changed spans
(3,2)-(3,65)
let rec listReverseHelper =
  fun l ->
    fun ans ->
      match ans with
      | [] -> []
      | h :: t -> listReverseHelper t
                                    (h :: ans) in
listReverseHelper l []
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (3,2)-(5,24)) Rec [(VarPat (Just (3,10)-(3,27)) "listReverseHelper",Lam (Just (3,28)-(4,70)) (VarPat (Just (3,28)-(3,29)) "l") (Lam (Just (3,30)-(4,70)) (VarPat (Just (3,30)-(3,33)) "ans") (Case (Just (4,4)-(4,70)) (Var (Just (4,10)-(4,13)) "ans") [(ConPat (Just (4,21)-(4,23)) "[]" Nothing,Nothing,List (Just (4,27)-(4,29)) [] Nothing),(ConsPat (Just (4,32)-(4,36)) (VarPat (Just (4,32)-(4,33)) "h") (VarPat (Just (4,35)-(4,36)) "t"),Nothing,App (Just (4,40)-(4,70)) (Var (Just (4,40)-(4,57)) "listReverseHelper") [Var (Just (4,58)-(4,59)) "t",ConApp (Just (4,60)-(4,70)) "::" (Just (Tuple (Just (4,61)-(4,69)) [Var (Just (4,61)-(4,62)) "h",Var (Just (4,66)-(4,69)) "ans"])) Nothing])]) Nothing) Nothing)] (App (Just (5,2)-(5,24)) (Var (Just (5,2)-(5,19)) "listReverseHelper") [Var (Just (5,20)-(5,21)) "l",List (Just (5,22)-(5,24)) [] Nothing])
*)

(* typed spans
(3,2)-(5,24)
*)

(* correct types
'a list
*)

(* bad types
'a list list
*)
