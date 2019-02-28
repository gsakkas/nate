
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map (sepConcat "" l) f;;


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
(9,32)-(9,48)
sepConcat
VarG

(9,32)-(9,48)
""
LitG

(9,32)-(9,48)
List.map f l
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (9,23)-(9,32)) "sepConcat"
Lit (Just (9,33)-(9,35)) (LS "")
App (Just (9,36)-(9,50)) (Var (Just (9,37)-(9,45)) "List.map") [Var (Just (9,46)-(9,47)) "f",Var (Just (9,48)-(9,49)) "l"]
*)

(* typed spans
(9,23)-(9,32)
(9,33)-(9,35)
(9,36)-(9,50)
*)

(* correct types
string -> string list -> string
string
string list
*)

(* bad types
string
string
string
*)
