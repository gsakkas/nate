
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat List.map l;;


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
(9,33)-(9,41)
" "
LitG

*)

(* changed exprs
Lit (Just (9,33)-(9,36)) (LS " ")
*)

(* typed spans
(9,33)-(9,36)
*)

(* correct types
string
*)

(* bad types
('a -> 'b) -> 'a list -> 'b list
*)
