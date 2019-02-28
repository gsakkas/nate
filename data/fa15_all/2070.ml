
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ (sepConcat "; " List.map (f, l));;


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
(9,29)-(9,61)
sepConcat
VarG

(9,29)-(9,61)
"; "
LitG

(9,29)-(9,61)
List.map f l
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (9,23)-(9,32)) "sepConcat"
Lit (Just (9,33)-(9,37)) (LS "; ")
App (Just (9,38)-(9,52)) (Var (Just (9,39)-(9,47)) "List.map") [Var (Just (9,48)-(9,49)) "f",Var (Just (9,50)-(9,51)) "l"]
*)

(* typed spans
(9,23)-(9,32)
(9,33)-(9,37)
(9,38)-(9,52)
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
