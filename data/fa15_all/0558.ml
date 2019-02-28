
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" List.map (f l)) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map f l);;

*)

(* changed spans
(9,23)-(9,26)
EMPTY
EmptyG

(9,27)-(9,28)
EMPTY
EmptyG

(9,29)-(9,67)
EMPTY
EmptyG

(9,30)-(9,60)
EMPTY
EmptyG

(9,45)-(9,53)
List.map f l
AppG (fromList [VarG])

(9,54)-(9,59)
EMPTY
EmptyG

(9,61)-(9,62)
EMPTY
EmptyG

(9,63)-(9,66)
EMPTY
EmptyG

*)

(* typed spans
string list
*)
