
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map f (sepConcat ";" l);;


(* fix

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map f l);;

*)

(* changed spans
(9,23)-(9,31)
EMPTY
EmptyG

(9,32)-(9,33)
EMPTY
EmptyG

(9,34)-(9,51)
EMPTY
EmptyG

(9,49)-(9,50)
List.map f l
AppG (fromList [VarG])

*)
