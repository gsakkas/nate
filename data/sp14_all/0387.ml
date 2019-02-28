
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (listReverse explode w) == w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (listReverse (explode w)) == (explode w);;

*)

(* changed spans
(10,19)-(10,42)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

(10,46)-(10,47)
explode w
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (10,19)-(10,44)) (Var (Just (10,20)-(10,31)) "listReverse") [App (Just (10,32)-(10,43)) (Var (Just (10,33)-(10,40)) "explode") [Var (Just (10,41)-(10,42)) "w"]]
App (Just (10,48)-(10,59)) (Var (Just (10,49)-(10,56)) "explode") [Var (Just (10,57)-(10,58)) "w"]
*)

(* typed spans
(10,19)-(10,44)
(10,48)-(10,59)
*)

(* correct types
char list
char list
*)

(* bad types
'a
'a
*)
