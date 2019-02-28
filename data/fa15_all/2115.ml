
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" [List.map (f l)]) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(9,45)-(9,61)
List.map f l
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (9,45)-(9,59)) (Var (Just (9,46)-(9,54)) "List.map") [Var (Just (9,55)-(9,56)) "f",Var (Just (9,57)-(9,58)) "l"]
*)

(* typed spans
(9,45)-(9,59)
*)

(* correct types
string list
*)

(* bad types
'a list -> 'b list list
*)
