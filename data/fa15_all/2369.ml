
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = match explode w with | [] -> true | h::t -> explode w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(7,15)-(7,72)
fun x ->
  match explode x with
  | h :: t -> false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,63)-(7,70)
matchHeads
VarG

*)

(* changed exprs
Lam (Just (7,19)-(7,59)) (VarPat (Just (7,19)-(7,20)) "x") (Case (Just (7,23)-(7,59)) (App (Just (7,29)-(7,38)) (Var (Just (7,29)-(7,36)) "explode") [Var (Just (7,37)-(7,38)) "x"]) [(ConsPat (Just (7,46)-(7,50)) (VarPat (Just (7,46)-(7,47)) "h") (VarPat (Just (7,49)-(7,50)) "t"),Nothing,Lit (Just (7,54)-(7,59)) (LB False))]) Nothing
Var (Just (9,63)-(9,73)) "matchHeads"
*)

(* typed spans
(7,19)-(7,59)
(9,63)-(9,73)
*)

(* correct types
string -> bool
string -> bool
*)

(* bad types
string -> bool
string -> char list
*)
