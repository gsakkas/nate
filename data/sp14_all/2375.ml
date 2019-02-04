
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = (List.append "[") ::
  ((sepConcat ";" (List.map f l)) "]");;


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
(9,23)-(9,40)
EMPTY
EmptyG

(9,23)-(10,38)
EMPTY
EmptyG

(9,24)-(9,35)
EMPTY
EmptyG

(9,36)-(9,39)
EMPTY
EmptyG

(10,2)-(10,38)
EMPTY
EmptyG

(10,34)-(10,37)
EMPTY
EmptyG

*)
