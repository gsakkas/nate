
let rec concat w = match w with | [] -> "" | h::t -> h ^ (concat t);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (concat (listReverse (explode w))) == w;;


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
(12,27)-(12,52)
listReverse
VarG

(12,27)-(12,52)
explode w
AppG (fromList [VarG])

(12,27)-(12,52)
explode
VarG

(12,27)-(12,52)
w
VarG

(12,27)-(12,52)
explode w
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (10,20)-(10,31)) "listReverse"
App (Just (10,32)-(10,43)) (Var (Just (10,33)-(10,40)) "explode") [Var (Just (10,41)-(10,42)) "w"]
Var (Just (10,33)-(10,40)) "explode"
Var (Just (10,41)-(10,42)) "w"
App (Just (10,48)-(10,59)) (Var (Just (10,49)-(10,56)) "explode") [Var (Just (10,57)-(10,58)) "w"]
*)

(* typed spans
(10,20)-(10,31)
(10,32)-(10,43)
(10,33)-(10,40)
(10,41)-(10,42)
(10,48)-(10,59)
*)

(* correct types
char list -> char list
char list
string -> char list
string
char list
*)

(* bad types
char list
char list
char list
char list
char list
*)
