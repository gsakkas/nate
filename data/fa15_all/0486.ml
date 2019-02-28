
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let palindrome w =
  let l = explode w in
  let lr = listReverse l in if l :: lr then true else false;;


(* fix

let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let palindrome w =
  let l = explode w in
  let lr = listReverse l in if l = lr then true else false;;

*)

(* changed spans
(14,31)-(14,38)
l = lr
BopG VarG VarG

*)

(* changed exprs
Bop (Just (14,31)-(14,37)) Eq (Var (Just (14,31)-(14,32)) "l") (Var (Just (14,35)-(14,37)) "lr")
*)

(* typed spans
(14,31)-(14,37)
*)

(* correct types
bool
*)

(* bad types
char list list
*)
