
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat (";" List.map (f l))) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(9,30)-(9,62)
EMPTY
EmptyG

(9,31)-(9,40)
EMPTY
EmptyG

(9,42)-(9,45)
sepConcat
VarG

(9,46)-(9,54)
List.map f l
AppG (fromList [VarG])

(9,55)-(9,60)
EMPTY
EmptyG

*)
