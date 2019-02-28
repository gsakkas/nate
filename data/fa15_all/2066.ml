
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let strs = List.map (f, l) in sepConcat "; " strs;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " l;;

*)

(* changed spans
(9,23)-(9,72)
EMPTY
EmptyG

(9,34)-(9,42)
EMPTY
EmptyG

(9,34)-(9,49)
EMPTY
EmptyG

(9,43)-(9,49)
EMPTY
EmptyG

(9,44)-(9,45)
EMPTY
EmptyG

(9,47)-(9,48)
EMPTY
EmptyG

(9,68)-(9,72)
l
VarG

*)

(* typed spans
string list
*)
