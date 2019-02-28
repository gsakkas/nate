
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" List.map (f l)) ^ "]");;


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
(7,30)-(7,32)
t
VarG

(9,30)-(9,60)
sepConcat ";" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
Var (Just (7,30)-(7,31)) "t"
App (Just (9,30)-(9,60)) (Var (Just (9,31)-(9,40)) "sepConcat") [Lit (Just (9,41)-(9,44)) (LS ";"),App (Just (9,45)-(9,59)) (Var (Just (9,46)-(9,54)) "List.map") [Var (Just (9,55)-(9,56)) "f",Var (Just (9,57)-(9,58)) "l"]]
*)

(* typed spans
(7,30)-(7,31)
(9,30)-(9,60)
*)

(* correct types
string list
string
*)

(* bad types
string list
string
*)
