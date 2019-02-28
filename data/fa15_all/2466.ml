
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (List.map f l) [""];;


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
(9,33)-(9,47)
""
LitG

*)

(* changed exprs
Lit (Just (9,33)-(9,35)) (LS "")
*)

(* typed spans
(9,33)-(9,35)
*)

(* correct types
string
*)

(* bad types
'a list
*)
