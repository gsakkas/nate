
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ("; ", (List.map (f, l)))) ^ "]");;


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
(9,27)-(9,28)
EMPTY
EmptyG

(9,41)-(9,66)
EMPTY
EmptyG

(9,48)-(9,65)
List.map f l
AppG (fromList [VarG])

(9,58)-(9,64)
EMPTY
EmptyG

(9,70)-(9,73)
EMPTY
EmptyG

*)

(* typed spans
(9,38)-(9,52)
*)

(* typed spans
string list
*)

(* typed spans
'a
*)
