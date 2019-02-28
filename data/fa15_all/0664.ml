
let rec listReverse l =
  match l with | [] -> [1] | front::back -> (listReverse back) :: front;;


(* fix

let rec listReverse l =
  let rec recurse original reverse =
    match original with
    | [] -> reverse
    | front::back -> recurse back (front :: reverse) in
  recurse l [];;

*)

(* changed spans
(3,2)-(3,71)
let rec recurse =
  fun original ->
    fun reverse ->
      match original with
      | [] -> reverse
      | front :: back -> recurse back
                                 (front :: reverse) in
recurse l []
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (3,2)-(7,14)) Rec [(VarPat (Just (3,10)-(3,17)) "recurse",Lam (Just (3,18)-(6,52)) (VarPat (Just (3,18)-(3,26)) "original") (Lam (Just (3,27)-(6,52)) (VarPat (Just (3,27)-(3,34)) "reverse") (Case (Just (4,4)-(6,52)) (Var (Just (4,10)-(4,18)) "original") [(ConPat (Just (5,6)-(5,8)) "[]" Nothing,Nothing,Var (Just (5,12)-(5,19)) "reverse"),(ConsPat (Just (6,6)-(6,17)) (VarPat (Just (6,6)-(6,11)) "front") (VarPat (Just (6,13)-(6,17)) "back"),Nothing,App (Just (6,21)-(6,52)) (Var (Just (6,21)-(6,28)) "recurse") [Var (Just (6,29)-(6,33)) "back",ConApp (Just (6,34)-(6,52)) "::" (Just (Tuple (Just (6,35)-(6,51)) [Var (Just (6,35)-(6,40)) "front",Var (Just (6,44)-(6,51)) "reverse"])) Nothing])]) Nothing) Nothing)] (App (Just (7,2)-(7,14)) (Var (Just (7,2)-(7,9)) "recurse") [Var (Just (7,10)-(7,11)) "l",List (Just (7,12)-(7,14)) [] Nothing])
*)

(* typed spans
(3,2)-(7,14)
*)

(* correct types
'a list
*)

(* bad types
int list
*)
