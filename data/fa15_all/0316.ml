
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat List.map f l) ^ "]");;


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

(9,29)-(9,61)
EMPTY
EmptyG

(9,30)-(9,54)
EMPTY
EmptyG

(9,41)-(9,49)
List.map f l
AppG (fromList [VarG])

(9,55)-(9,56)
EMPTY
EmptyG

(9,57)-(9,60)
EMPTY
EmptyG

*)
