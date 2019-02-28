
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | head::tail -> (listReverse tail) @ [head];;

let palindrome w =
  if (explode w) = (explode (listReverse w)) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | head::tail -> (listReverse tail) @ [head];;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(11,28)-(11,43)
listReverse
VarG

(11,28)-(11,43)
explode w
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (11,20)-(11,31)) "listReverse"
App (Just (11,32)-(11,43)) (Var (Just (11,33)-(11,40)) "explode") [Var (Just (11,41)-(11,42)) "w"]
*)

(* typed spans
(11,20)-(11,31)
(11,32)-(11,43)
*)

(* correct types
char list -> char list
char list
*)

(* bad types
string
string
*)
