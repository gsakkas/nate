
let rec helperAppend l n =
  match l with | [] -> n | h::t -> h :: (helperAppend t n);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> helperAppend (listReverse t) [h];;

let palindrome w = (listReverse (explode w)) = w;;


(* fix

let rec helperAppend l n =
  match l with | [] -> n | h::t -> h :: (helperAppend t n);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> helperAppend (listReverse t) [h];;

let palindrome w = (listReverse (explode w)) = (explode w);;

*)

(* changed spans
(13,47)-(13,48)
explode w
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (13,47)-(13,58)) (Var (Just (13,48)-(13,55)) "explode") [Var (Just (13,56)-(13,57)) "w"]
*)

(* typed spans
(13,47)-(13,58)
*)

(* correct types
char list
*)

(* bad types
string
*)
