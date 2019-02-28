
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with | [] -> "[]" | l -> sepConcat (List.map f l);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with | [] -> "[]" | l -> sepConcat ";" (List.map f l);;

*)

(* changed spans
(10,35)-(10,59)
sepConcat ";" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (10,35)-(10,63)) (Var (Just (10,35)-(10,44)) "sepConcat") [Lit (Just (10,45)-(10,48)) (LS ";"),App (Just (10,49)-(10,63)) (Var (Just (10,50)-(10,58)) "List.map") [Var (Just (10,59)-(10,60)) "f",Var (Just (10,61)-(10,62)) "l"]]
*)

(* typed spans
(10,35)-(10,63)
*)

(* correct types
string
*)

(* bad types
string
*)
