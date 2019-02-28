
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map sepConcat "; ";;


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
(9,42)-(9,46)
List.map f l
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (9,38)-(9,52)) (Var (Just (9,39)-(9,47)) "List.map") [Var (Just (9,48)-(9,49)) "f",Var (Just (9,50)-(9,51)) "l"]
*)

(* typed spans
(9,38)-(9,52)
*)

(* correct types
string list
*)

(* bad types
string
*)
