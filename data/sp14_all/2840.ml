
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let listReverse l =
  let rec helper xs = function | [] -> xs | hd::tl -> helper (hd :: xs) tl in
  helper [];;

let palindrome w =
  if (listReverse (explode w)) = (explode w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let listReverse l =
  let rec helper xs l =
    match l with | [] -> [] | hd::tl -> helper (hd :: xs) l in
  helper [] l;;

let palindrome w =
  if (listReverse (explode w)) = (explode w) then true else false;;

*)

(* changed spans
(8,22)-(8,74)
fun l ->
  match l with
  | [] -> []
  | hd :: tl -> helper (hd :: xs)
                       l
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(9,2)-(9,8)
helper [] l
AppG (fromList [VarG,ListG EmptyG])

(11,15)-(12,65)
l
VarG

*)

(* changed exprs
Lam (Just (8,20)-(9,59)) (VarPat (Just (8,20)-(8,21)) "l") (Case (Just (9,4)-(9,59)) (Var (Just (9,10)-(9,11)) "l") [(ConPat (Just (9,19)-(9,21)) "[]" Nothing,Nothing,List (Just (9,25)-(9,27)) [] Nothing),(ConsPat (Just (9,30)-(9,36)) (VarPat (Just (9,30)-(9,32)) "hd") (VarPat (Just (9,34)-(9,36)) "tl"),Nothing,App (Just (9,40)-(9,59)) (Var (Just (9,40)-(9,46)) "helper") [ConApp (Just (9,47)-(9,57)) "::" (Just (Tuple (Just (9,48)-(9,56)) [Var (Just (9,48)-(9,50)) "hd",Var (Just (9,54)-(9,56)) "xs"])) Nothing,Var (Just (9,58)-(9,59)) "l"])]) Nothing
App (Just (10,2)-(10,13)) (Var (Just (10,2)-(10,8)) "helper") [List (Just (10,9)-(10,11)) [] Nothing,Var (Just (10,12)-(10,13)) "l"]
Var (Just (10,12)-(10,13)) "l"
*)

(* typed spans
(8,20)-(9,59)
(10,2)-(10,13)
(10,12)-(10,13)
*)

(* correct types
char list -> char list
char list
char list
*)

(* bad types
'a list -> 'a list
'a list -> 'a list -> 'a list
string -> bool
*)
