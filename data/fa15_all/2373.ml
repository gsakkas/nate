
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = match explode w with | [] -> [] | h::t -> w @ [];;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(7,15)-(7,67)
fun x ->
  match explode x with
  | h :: t -> false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,61)-(7,67)
true
LitG

(7,61)-(7,62)
matchHeads w
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (7,19)-(7,59)) (VarPat (Just (7,19)-(7,20)) "x") (Case (Just (7,23)-(7,59)) (App (Just (7,29)-(7,38)) (Var (Just (7,29)-(7,36)) "explode") [Var (Just (7,37)-(7,38)) "x"]) [(ConsPat (Just (7,46)-(7,50)) (VarPat (Just (7,46)-(7,47)) "h") (VarPat (Just (7,49)-(7,50)) "t"),Nothing,Lit (Just (7,54)-(7,59)) (LB False))]) Nothing
Lit (Just (9,48)-(9,52)) (LB True)
App (Just (9,63)-(9,75)) (Var (Just (9,63)-(9,73)) "matchHeads") [Var (Just (9,74)-(9,75)) "w"]
*)

(* typed spans
(7,19)-(7,59)
(9,48)-(9,52)
(9,63)-(9,75)
*)

(* correct types
string -> bool
bool
bool
*)

(* bad types
string -> 'a list
'a list
string
*)
