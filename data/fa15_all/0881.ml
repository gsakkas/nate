
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::[] -> "[" ^ (x ^ "]")
  | l -> List.map (f, (sepConcat f l));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::[] -> "[" ^ (x ^ "]")
  | l -> sepConcat "" (List.map f l);;

*)

(* changed spans
(13,9)-(13,38)
sepConcat "" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* changed exprs
App (Just (13,9)-(13,36)) (Var (Just (13,9)-(13,18)) "sepConcat") [Lit (Just (13,19)-(13,21)) (LS ""),App (Just (13,22)-(13,36)) (Var (Just (13,23)-(13,31)) "List.map") [Var (Just (13,32)-(13,33)) "f",Var (Just (13,34)-(13,35)) "l"]]
*)

(* typed spans
(13,9)-(13,36)
*)

(* correct types
string
*)

(* bad types
string
*)
