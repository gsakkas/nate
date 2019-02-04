
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = ("[" sepConcat "" (List.map f l)) ^ "]";;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat " " (List.map f l)) ^ "]");;

*)

(* changed spans
(9,23)-(9,56)
EMPTY
EmptyG

(9,28)-(9,37)
sepConcat " " (List.map f
                        l) ^ "]"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,38)-(9,40)
" "
LitG

*)
