
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = "" in let l x = x ^ sep in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = "" in
      let l = [(fun x  -> x ^ sep)] in List.fold_left f base l;;

*)

(* changed spans
(7,29)-(7,40)
[fun x -> x ^ sep]
ListG (LamG EmptyG)

*)

(* changed exprs
List (Just (8,14)-(8,35)) [Lam (Just (8,15)-(8,34)) (VarPat (Just (8,20)-(8,21)) "x") (App (Just (8,26)-(8,33)) (Var (Just (8,28)-(8,29)) "^") [Var (Just (8,26)-(8,27)) "x",Var (Just (8,30)-(8,33)) "sep"]) Nothing] Nothing
*)

(* typed spans
(8,14)-(8,35)
*)

(* correct types
string -> string list
*)

(* bad types
string -> string
*)
