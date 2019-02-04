
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
(9,23)-(9,26)
EMPTY
EmptyG

(9,27)-(9,28)
EMPTY
EmptyG

(9,29)-(9,74)
EMPTY
EmptyG

(9,30)-(9,67)
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

(9,68)-(9,69)
EMPTY
EmptyG

(9,70)-(9,73)
EMPTY
EmptyG

*)
