
let append x l = match l with | [] -> [x] | _ -> x :: l;;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10) [n mod 10]);;


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

(5,25)-(5,65)
append (digitsOfInt (n / 10))
       [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

(5,25)-(5,65)
append
VarG

(5,33)-(5,44)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
Let (Just (3,2)-(5,15)) Rec [(VarPat (Just (3,10)-(3,16)) "helper",Lam (Just (3,17)-(4,58)) (VarPat (Just (3,17)-(3,18)) "x") (Lam (Just (3,19)-(4,58)) (VarPat (Just (3,19)-(3,20)) "l") (Lam (Just (3,21)-(4,58)) (VarPat (Just (3,21)-(3,24)) "acc") (Case (Just (4,4)-(4,58)) (Var (Just (4,10)-(4,11)) "x") [(ConPat (Just (4,19)-(4,21)) "[]" Nothing,Nothing,Var (Just (4,25)-(4,26)) "l"),(ConsPat (Just (4,29)-(4,33)) (VarPat (Just (4,29)-(4,30)) "h") (VarPat (Just (4,32)-(4,33)) "t"),Nothing,App (Just (4,37)-(4,58)) (Var (Just (4,37)-(4,43)) "helper") [Var (Just (4,44)-(4,45)) "t",Var (Just (4,46)-(4,47)) "l",ConApp (Just (4,48)-(4,58)) "::" (Just (Tuple (Just (4,49)-(4,57)) [Var (Just (4,49)-(4,50)) "h",Var (Just (4,54)-(4,57)) "acc"])) Nothing])]) Nothing) Nothing) Nothing)] (App (Just (5,2)-(5,15)) (Var (Just (5,2)-(5,8)) "helper") [Var (Just (5,9)-(5,10)) "x",Var (Just (5,11)-(5,12)) "l",List (Just (5,13)-(5,15)) [] Nothing])
App (Just (8,25)-(8,65)) (Var (Just (8,25)-(8,31)) "append") [App (Just (8,32)-(8,54)) (Var (Just (8,33)-(8,44)) "digitsOfInt") [Bop (Just (8,45)-(8,53)) Div (Var (Just (8,46)-(8,47)) "n") (Lit (Just (8,50)-(8,52)) (LI 10))],List (Just (8,55)-(8,65)) [Bop (Just (8,56)-(8,64)) Mod (Var (Just (8,56)-(8,57)) "n") (Lit (Just (8,62)-(8,64)) (LI 10))] Nothing]
Var (Just (8,25)-(8,31)) "append"
App (Just (8,32)-(8,54)) (Var (Just (8,33)-(8,44)) "digitsOfInt") [Bop (Just (8,45)-(8,53)) Div (Var (Just (8,46)-(8,47)) "n") (Lit (Just (8,50)-(8,52)) (LI 10))]
*)

(* typed spans
(3,2)-(5,15)
(8,25)-(8,65)
(8,25)-(8,31)
(8,32)-(8,54)
*)

(* correct types
int list
int list
int list -> int list -> int list
int list
*)

(* bad types
int list
int list -> int list
int list -> int list
int -> int list -> int
*)
