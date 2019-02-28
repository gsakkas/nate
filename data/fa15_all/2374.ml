
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = x;;

let palindrome w = match explode w with | [] -> [] | h::t -> matchHeads w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(7,23)-(7,24)
match explode x with
| h :: t -> false
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,LitG)])

(9,48)-(9,50)
true
LitG

*)

(* changed exprs
Case (Just (7,23)-(7,59)) (App (Just (7,29)-(7,38)) (Var (Just (7,29)-(7,36)) "explode") [Var (Just (7,37)-(7,38)) "x"]) [(ConsPat (Just (7,46)-(7,50)) (VarPat (Just (7,46)-(7,47)) "h") (VarPat (Just (7,49)-(7,50)) "t"),Nothing,Lit (Just (7,54)-(7,59)) (LB False))]
Lit (Just (9,48)-(9,52)) (LB True)
*)

(* typed spans
(7,23)-(7,59)
(9,48)-(9,52)
*)

(* correct types
bool
bool
*)

(* bad types
string
'a list
*)
