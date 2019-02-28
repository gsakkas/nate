
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (listReverse (explode w)) == w;;


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
(10,48)-(10,49)
explode w
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (10,48)-(10,59)) (Var (Just (10,49)-(10,56)) "explode") [Var (Just (10,57)-(10,58)) "w"]
*)

(* typed spans
(10,48)-(10,59)
*)

(* correct types
char list
*)

(* bad types
string
*)
