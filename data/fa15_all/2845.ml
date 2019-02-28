
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (List.map l);;


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
(9,23)-(9,45)
sepConcat " " l
AppG (fromList [VarG,LitG])

*)

(* changed exprs
App (Just (9,23)-(9,38)) (Var (Just (9,23)-(9,32)) "sepConcat") [Lit (Just (9,33)-(9,36)) (LS " "),Var (Just (9,37)-(9,38)) "l"]
*)

(* typed spans
(9,23)-(9,38)
*)

(* correct types
string
*)

(* bad types
'a
*)
