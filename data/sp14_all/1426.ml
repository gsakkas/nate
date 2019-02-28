
let append x l = match l with | [] -> [x] | _ -> x :: l;;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;


(* fix

let append x l =
  let rec helper x l acc =
    match x with | [] -> l | h::t -> helper t l (h :: acc) in
  helper x l [];;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(2,17)-(2,55)
let rec helper =
  fun x ->
    fun l ->
      fun acc ->
        match x with
        | [] -> l
        | h :: t -> helper t l
                           (h :: acc) in
helper x l []
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (3,2)-(5,15)) Rec [(VarPat (Just (3,10)-(3,16)) "helper",Lam (Just (3,17)-(4,58)) (VarPat (Just (3,17)-(3,18)) "x") (Lam (Just (3,19)-(4,58)) (VarPat (Just (3,19)-(3,20)) "l") (Lam (Just (3,21)-(4,58)) (VarPat (Just (3,21)-(3,24)) "acc") (Case (Just (4,4)-(4,58)) (Var (Just (4,10)-(4,11)) "x") [(ConPat (Just (4,19)-(4,21)) "[]" Nothing,Nothing,Var (Just (4,25)-(4,26)) "l"),(ConsPat (Just (4,29)-(4,33)) (VarPat (Just (4,29)-(4,30)) "h") (VarPat (Just (4,32)-(4,33)) "t"),Nothing,App (Just (4,37)-(4,58)) (Var (Just (4,37)-(4,43)) "helper") [Var (Just (4,44)-(4,45)) "t",Var (Just (4,46)-(4,47)) "l",ConApp (Just (4,48)-(4,58)) "::" (Just (Tuple (Just (4,49)-(4,57)) [Var (Just (4,49)-(4,50)) "h",Var (Just (4,54)-(4,57)) "acc"])) Nothing])]) Nothing) Nothing) Nothing)] (App (Just (5,2)-(5,15)) (Var (Just (5,2)-(5,8)) "helper") [Var (Just (5,9)-(5,10)) "x",Var (Just (5,11)-(5,12)) "l",List (Just (5,13)-(5,15)) [] Nothing])
*)

(* typed spans
(3,2)-(5,15)
*)

(* correct types
int list
*)

(* bad types
int list
*)
