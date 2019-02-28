
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec revexp (x,y) = match x with | [] -> y | h::t -> revexp (t, (h ^ y));;

let palindrome w = if w = (revexp ((explode w), "")) then true else false;;


(* fix

let rec reverse (x,y) =
  match x with | [] -> y | h::t -> reverse (t, (h :: y));;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = match l with | [] -> [] | h::t -> reverse (l, []);;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(2,12)-(5,6)
fun (x , y) ->
  match x with
  | [] -> y
  | h :: t -> reverse (t , h :: y)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,16)-(7,75)
fun l ->
  match l with
  | [] -> []
  | h :: t -> reverse (l , [])
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(9,22)-(9,23)
explode w
AppG (fromList [VarG])

(9,34)-(9,51)
listReverse
VarG

*)

(* changed exprs
Lam (Just (2,17)-(3,56)) (TuplePat (Just (2,17)-(2,20)) [VarPat (Just (2,17)-(2,18)) "x",VarPat (Just (2,19)-(2,20)) "y"]) (Case (Just (3,2)-(3,56)) (Var (Just (3,8)-(3,9)) "x") [(ConPat (Just (3,17)-(3,19)) "[]" Nothing,Nothing,Var (Just (3,23)-(3,24)) "y"),(ConsPat (Just (3,27)-(3,31)) (VarPat (Just (3,27)-(3,28)) "h") (VarPat (Just (3,30)-(3,31)) "t"),Nothing,App (Just (3,35)-(3,56)) (Var (Just (3,35)-(3,42)) "reverse") [Tuple (Just (3,43)-(3,56)) [Var (Just (3,44)-(3,45)) "t",ConApp (Just (3,47)-(3,55)) "::" (Just (Tuple (Just (3,48)-(3,54)) [Var (Just (3,48)-(3,49)) "h",Var (Just (3,53)-(3,54)) "y"])) Nothing]])]) Nothing
Lam (Just (10,20)-(10,73)) (VarPat (Just (10,20)-(10,21)) "l") (Case (Just (10,24)-(10,73)) (Var (Just (10,30)-(10,31)) "l") [(ConPat (Just (10,39)-(10,41)) "[]" Nothing,Nothing,List (Just (10,45)-(10,47)) [] Nothing),(ConsPat (Just (10,50)-(10,54)) (VarPat (Just (10,50)-(10,51)) "h") (VarPat (Just (10,53)-(10,54)) "t"),Nothing,App (Just (10,58)-(10,73)) (Var (Just (10,58)-(10,65)) "reverse") [Tuple (Just (10,66)-(10,73)) [Var (Just (10,67)-(10,68)) "l",List (Just (10,70)-(10,72)) [] Nothing]])]) Nothing
App (Just (13,5)-(13,16)) (Var (Just (13,6)-(13,13)) "explode") [Var (Just (13,14)-(13,15)) "w"]
Var (Just (13,20)-(13,31)) "listReverse"
*)

(* typed spans
(2,17)-(3,56)
(10,20)-(10,73)
(13,5)-(13,16)
(13,20)-(13,31)
*)

(* correct types
(char list * char list) -> char list
char list -> char list
char list
char list -> char list
*)

(* bad types
string -> char list
(string list * string) -> string
string
(char list * string)
*)
