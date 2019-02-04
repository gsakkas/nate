
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (" " (List.map (f l)));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat " " l;;

*)

(* changed spans
(9,23)-(9,55)
sepConcat " " l
AppG (fromList [VarG,LitG])

(9,33)-(9,55)
EMPTY
EmptyG

(9,38)-(9,54)
EMPTY
EmptyG

(9,39)-(9,47)
EMPTY
EmptyG

(9,48)-(9,53)
EMPTY
EmptyG

(9,49)-(9,50)
EMPTY
EmptyG

*)
