
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" List.map f l;;


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
(9,23)-(9,49)
sepConcat "; " (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,33)-(9,36)
"; "
LitG

(9,37)-(9,45)
List.map f l
AppG (fromList [VarG])

*)
