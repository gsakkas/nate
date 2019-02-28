
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = (explode w) = w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(7,15)-(7,34)
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,33)-(7,34)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (7,20)-(8,57)) (VarPat (Just (7,20)-(7,21)) "l") (Case (Just (8,2)-(8,57)) (Var (Just (8,8)-(8,9)) "l") [(ConPat (Just (8,17)-(8,19)) "[]" Nothing,Nothing,List (Just (8,23)-(8,25)) [] Nothing),(ConsPat (Just (8,28)-(8,32)) (VarPat (Just (8,28)-(8,29)) "h") (VarPat (Just (8,31)-(8,32)) "t"),Nothing,App (Just (8,36)-(8,57)) (Var (Just (8,52)-(8,53)) "@") [App (Just (8,36)-(8,51)) (Var (Just (8,37)-(8,48)) "listReverse") [Var (Just (8,49)-(8,50)) "t"],List (Just (8,54)-(8,57)) [Var (Just (8,55)-(8,56)) "h"] Nothing])]) Nothing
App (Just (10,33)-(10,58)) (Var (Just (10,34)-(10,45)) "listReverse") [App (Just (10,46)-(10,57)) (Var (Just (10,47)-(10,54)) "explode") [Var (Just (10,55)-(10,56)) "w"]]
*)

(* typed spans
(7,20)-(8,57)
(10,33)-(10,58)
*)

(* correct types
char list -> char list
char list
*)

(* bad types
string -> bool
string
*)
