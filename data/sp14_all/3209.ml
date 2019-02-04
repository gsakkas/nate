
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map (sepConcat "" (f l)) (f l);;


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
(9,23)-(9,31)
EMPTY
EmptyG

(9,32)-(9,52)
EMPTY
EmptyG

(9,46)-(9,51)
EMPTY
EmptyG

(9,47)-(9,48)
EMPTY
EmptyG

(9,49)-(9,50)
EMPTY
EmptyG

(9,53)-(9,58)
List.map f l
AppG (fromList [VarG])

(9,54)-(9,55)
List.map
VarG

*)
