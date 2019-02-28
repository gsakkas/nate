
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = if (List.length sl) > 1 then h else h in
      let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (";", (List.map (fun c  -> l)));;


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

(10,23)-(10,64)
sepConcat ";" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Var (Just (7,17)-(7,18)) "h"
App (Just (9,23)-(9,51)) (Var (Just (9,23)-(9,32)) "sepConcat") [Lit (Just (9,33)-(9,36)) (LS ";"),App (Just (9,37)-(9,51)) (Var (Just (9,38)-(9,46)) "List.map") [Var (Just (9,47)-(9,48)) "f",Var (Just (9,49)-(9,50)) "l"]]
*)

(* typed spans
(7,17)-(7,18)
(9,23)-(9,51)
*)

(* correct types
string
string
*)

(* bad types
string
'a
*)
