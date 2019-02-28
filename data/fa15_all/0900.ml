
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = if String.length = 0 then true else explode w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | x::xs' -> (listReverse xs') @ [x];;

let palindrome w =
  let wList = explode w in
  let revList = listReverse wList in match revList with | wList -> true;;

*)

(* changed spans
(7,15)-(7,64)
fun l ->
  match l with
  | [] -> []
  | x :: xs' -> listReverse xs' @ [x]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,19)-(7,64)
let wList = explode w in
let revList =
  listReverse wList in
match revList with
| wList -> true
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (7,20)-(8,61)) (VarPat (Just (7,20)-(7,21)) "l") (Case (Just (8,2)-(8,61)) (Var (Just (8,8)-(8,9)) "l") [(ConPat (Just (8,17)-(8,19)) "[]" Nothing,Nothing,List (Just (8,23)-(8,25)) [] Nothing),(ConsPat (Just (8,28)-(8,34)) (VarPat (Just (8,28)-(8,29)) "x") (VarPat (Just (8,31)-(8,34)) "xs'"),Nothing,App (Just (8,38)-(8,61)) (Var (Just (8,56)-(8,57)) "@") [App (Just (8,38)-(8,55)) (Var (Just (8,39)-(8,50)) "listReverse") [Var (Just (8,51)-(8,54)) "xs'"],List (Just (8,58)-(8,61)) [Var (Just (8,59)-(8,60)) "x"] Nothing])]) Nothing
Let (Just (11,2)-(12,71)) NonRec [(VarPat (Just (11,6)-(11,11)) "wList",App (Just (11,14)-(11,23)) (Var (Just (11,14)-(11,21)) "explode") [Var (Just (11,22)-(11,23)) "w"])] (Let (Just (12,2)-(12,71)) NonRec [(VarPat (Just (12,6)-(12,13)) "revList",App (Just (12,16)-(12,33)) (Var (Just (12,16)-(12,27)) "listReverse") [Var (Just (12,28)-(12,33)) "wList"])] (Case (Just (12,37)-(12,71)) (Var (Just (12,43)-(12,50)) "revList") [(VarPat (Just (12,58)-(12,63)) "wList",Nothing,Lit (Just (12,67)-(12,71)) (LB True))]))
*)

(* typed spans
(7,20)-(8,61)
(11,2)-(12,71)
*)

(* correct types
char list -> char list
bool
*)

(* bad types
string -> char list
char list
*)
