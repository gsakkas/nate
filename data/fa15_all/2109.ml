
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map f) ^ ((sepConcat (";" l)) ^ "]"));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(9,30)-(9,42)
EMPTY
EmptyG

(9,31)-(9,39)
EMPTY
EmptyG

(9,40)-(9,41)
EMPTY
EmptyG

(9,46)-(9,65)
EMPTY
EmptyG

(9,57)-(9,64)
EMPTY
EmptyG

(9,62)-(9,63)
List.map f l
AppG (fromList [VarG])

(9,66)-(9,67)
EMPTY
EmptyG

*)
