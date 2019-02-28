
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

let stringOfList f l = sepConcat "; " (List.map f l);;

*)

(* changed spans
(9,33)-(9,41)
"; "
LitG

(9,33)-(9,41)
List.map f l
AppG (fromList [VarG])

(9,42)-(9,43)
f
VarG

*)

(* changed exprs
Lit (Just (9,33)-(9,37)) (LS "; ")
App (Just (9,38)-(9,52)) (Var (Just (9,39)-(9,47)) "List.map") [Var (Just (9,48)-(9,49)) "f",Var (Just (9,50)-(9,51)) "l"]
Var (Just (9,48)-(9,49)) "f"
*)

(* typed spans
(9,33)-(9,37)
(9,38)-(9,52)
(9,48)-(9,49)
*)

(* correct types
string
string list
'a -> string
*)

(* bad types
('a -> 'b) -> 'a list -> 'b list
('a -> 'b) -> 'a list -> 'b list
'a
*)
