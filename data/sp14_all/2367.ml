
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = failwith List.map (sepConcat " ") l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "," (List.map f l);;

*)

(* changed spans
(9,23)-(9,31)
EMPTY
EmptyG

(9,23)-(9,58)
EMPTY
EmptyG

(9,32)-(9,40)
EMPTY
EmptyG

(9,41)-(9,56)
sepConcat "," (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,52)-(9,55)
","
LitG

(9,57)-(9,58)
List.map f l
AppG (fromList [VarG])

*)