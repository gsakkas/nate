
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map (sepConcat "; " l) l) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " (List.map f l);;

*)

(* changed spans
(9,23)-(9,26)
EMPTY
EmptyG

(9,27)-(9,28)
EMPTY
EmptyG

(9,29)-(9,68)
EMPTY
EmptyG

(9,30)-(9,61)
EMPTY
EmptyG

(9,31)-(9,39)
EMPTY
EmptyG

(9,40)-(9,58)
EMPTY
EmptyG

(9,56)-(9,57)
List.map f l
AppG (fromList [VarG])

(9,59)-(9,60)
f
VarG

(9,62)-(9,63)
EMPTY
EmptyG

(9,64)-(9,67)
EMPTY
EmptyG

*)

(* typed spans
string list
't57 -> string
*)
