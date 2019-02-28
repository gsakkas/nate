
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = if (List.length sl) > 1 then h else h in
      let l = t in List.fold_left f base l;;

let stringOfList f l = List.map (fun a  -> a l) sepConcat;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map f l);;

*)

(* changed spans
(7,17)-(7,54)
h
VarG

(10,23)-(10,57)
sepConcat
VarG

(10,23)-(10,57)
";"
LitG

(10,23)-(10,57)
List.map f l
AppG (fromList [VarG])

(10,32)-(10,47)
f
VarG

*)

(* changed exprs
Var (Just (7,17)-(7,18)) "h"
Var (Just (9,23)-(9,32)) "sepConcat"
Lit (Just (9,33)-(9,36)) (LS ";")
App (Just (9,37)-(9,51)) (Var (Just (9,38)-(9,46)) "List.map") [Var (Just (9,47)-(9,48)) "f",Var (Just (9,49)-(9,50)) "l"]
Var (Just (9,47)-(9,48)) "f"
*)

(* typed spans
(7,17)-(7,18)
(9,23)-(9,32)
(9,33)-(9,36)
(9,37)-(9,51)
(9,47)-(9,48)
*)

(* correct types
string
string -> string list -> string
string
string list
'a -> string
*)

(* bad types
string
'a
'a
'a
('a -> 'b) -> 'b
*)
