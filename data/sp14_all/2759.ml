
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = if (List.length sl) > 1 then h else h in
      let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map (fun c  -> c l));;


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

(10,37)-(10,63)
List.map f l
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (7,17)-(7,18)) "h"
App (Just (9,37)-(9,51)) (Var (Just (9,38)-(9,46)) "List.map") [Var (Just (9,47)-(9,48)) "f",Var (Just (9,49)-(9,50)) "l"]
*)

(* typed spans
(7,17)-(7,18)
(9,37)-(9,51)
*)

(* correct types
string
string list
*)

(* bad types
string
'a -> 'b list -> 'b list
*)
