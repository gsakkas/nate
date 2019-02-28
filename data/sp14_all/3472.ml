
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = explode l listReverse "nikhil";;


(* fix

let rec listReverse l = match l with | [] -> [];;

*)

(* changed spans
(7,24)-(7,54)
match l with
| [] -> []
CaseG VarG (fromList [(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (2,24)-(2,47)) (Var (Just (2,30)-(2,31)) "l") [(ConPat (Just (2,39)-(2,41)) "[]" Nothing,Nothing,List (Just (2,45)-(2,47)) [] Nothing)]
*)

(* typed spans
(2,24)-(2,47)
*)

(* correct types
'a list
*)

(* bad types
'a
*)
