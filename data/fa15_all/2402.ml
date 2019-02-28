
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  match explode w with | [] -> true | h::t -> listReverse (explode w);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads w =
  match w with
  | [] -> true
  | h::t -> if h = (List.hd (listReverse w)) then true else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(2,12)-(5,6)
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,20)-(8,57)
fun w ->
  match w with
  | [] -> true
  | h :: t -> if h = List.hd (listReverse w)
              then true
              else false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(11,46)-(11,57)
matchHeads
VarG

*)

(* changed exprs
Lam (Just (2,20)-(3,57)) (VarPat (Just (2,20)-(2,21)) "l") (Case (Just (3,2)-(3,57)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (3,17)-(3,19)) "[]" Nothing,Nothing,List (Just (3,23)-(3,25)) [] Nothing),(ConsPat (Just (3,28)-(3,32)) (VarPat (Just (3,28)-(3,29)) "h") (VarPat (Just (3,31)-(3,32)) "t"),Nothing,App (Just (3,36)-(3,57)) (Var (Just (3,52)-(3,53)) "@") [App (Just (3,36)-(3,51)) (Var (Just (3,37)-(3,48)) "listReverse") [Var (Just (3,49)-(3,50)) "t"],List (Just (3,54)-(3,57)) [Var (Just (3,55)-(3,56)) "h"] Nothing])]) Nothing
Lam (Just (10,19)-(13,65)) (VarPat (Just (10,19)-(10,20)) "w") (Case (Just (11,2)-(13,65)) (Var (Just (11,8)-(11,9)) "w") [(ConPat (Just (12,4)-(12,6)) "[]" Nothing,Nothing,Lit (Just (12,10)-(12,14)) (LB True)),(ConsPat (Just (13,4)-(13,8)) (VarPat (Just (13,4)-(13,5)) "h") (VarPat (Just (13,7)-(13,8)) "t"),Nothing,Ite (Just (13,12)-(13,65)) (Bop (Just (13,15)-(13,44)) Eq (Var (Just (13,15)-(13,16)) "h") (App (Just (13,19)-(13,44)) (Var (Just (13,20)-(13,27)) "List.hd") [App (Just (13,28)-(13,43)) (Var (Just (13,29)-(13,40)) "listReverse") [Var (Just (13,41)-(13,42)) "w"]])) (Lit (Just (13,50)-(13,54)) (LB True)) (Lit (Just (13,60)-(13,65)) (LB False)))]) Nothing
Var (Just (16,46)-(16,56)) "matchHeads"
*)

(* typed spans
(2,20)-(3,57)
(10,19)-(13,65)
(16,46)-(16,56)
*)

(* correct types
char list -> char list
char list -> bool
char list -> bool
*)

(* bad types
string -> char list
char list -> char list
char list -> char list
*)
