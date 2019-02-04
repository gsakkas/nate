
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = (List.map "[") ^ ((sepConcat l) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "" (List.map f l);;

*)

(* changed spans
(9,23)-(9,37)
EMPTY
EmptyG

(9,24)-(9,32)
EMPTY
EmptyG

(9,33)-(9,36)
EMPTY
EmptyG

(9,38)-(9,39)
EMPTY
EmptyG

(9,40)-(9,61)
EMPTY
EmptyG

(9,41)-(9,54)
EMPTY
EmptyG

(9,52)-(9,53)
List.map f l
AppG (fromList [VarG])

(9,55)-(9,56)
EMPTY
EmptyG

(9,57)-(9,60)
EMPTY
EmptyG

*)
