
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listCompare l k =
  if ((List.hd l) = []) && ((List.hd k) = [])
  then true
  else
    if (List.hd l) = (List.hd k)
    then listCompare (List.tl l) (List.tl k)
    else false;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> myAppend (listReverse t) h;;

let palindrome w = listCompare (explode w) (listReverse (explode w));;


(* fix

let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> myAppend (listReverse t) h;;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(17,20)-(18,62)
match l with
| [] -> []
| h :: t -> myAppend (listReverse t)
                     h
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

(20,19)-(20,68)
explode w = listReverse (explode w)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Case (Just (10,2)-(10,62)) (Var (Just (10,8)-(10,9)) "l") [(ConPat (Just (10,17)-(10,19)) "[]" Nothing,Nothing,List (Just (10,23)-(10,25)) [] Nothing),(ConsPat (Just (10,28)-(10,32)) (VarPat (Just (10,28)-(10,29)) "h") (VarPat (Just (10,31)-(10,32)) "t"),Nothing,App (Just (10,36)-(10,62)) (Var (Just (10,36)-(10,44)) "myAppend") [App (Just (10,45)-(10,60)) (Var (Just (10,46)-(10,57)) "listReverse") [Var (Just (10,58)-(10,59)) "t"],Var (Just (10,61)-(10,62)) "h"])]
Bop (Just (12,19)-(12,58)) Eq (App (Just (12,19)-(12,30)) (Var (Just (12,20)-(12,27)) "explode") [Var (Just (12,28)-(12,29)) "w"]) (App (Just (12,33)-(12,58)) (Var (Just (12,34)-(12,45)) "listReverse") [App (Just (12,46)-(12,57)) (Var (Just (12,47)-(12,54)) "explode") [Var (Just (12,55)-(12,56)) "w"]])
*)

(* typed spans
(10,2)-(10,62)
(12,19)-(12,58)
*)

(* correct types
char list
bool
*)

(* bad types
char list -> char list
'a
*)
