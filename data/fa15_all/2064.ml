
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (";", (List.map (f, l)));;


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
(9,23)-(9,57)
sepConcat "; " l
AppG (fromList [VarG,LitG])

(9,33)-(9,57)
EMPTY
EmptyG

(9,34)-(9,37)
EMPTY
EmptyG

(9,39)-(9,56)
EMPTY
EmptyG

(9,40)-(9,48)
EMPTY
EmptyG

(9,49)-(9,55)
EMPTY
EmptyG

(9,50)-(9,51)
"; "
LitG

*)
