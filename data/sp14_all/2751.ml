
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if List.length = 2 then a ^ x in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) < 2 then a ^ x else a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,21)-(6,36)
List.length t < 2
BopG (AppG (fromList [EmptyG])) LitG

(6,18)-(6,47)
a ^ (x ^ sep)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
Bop (Just (6,21)-(6,40)) Lt (App (Just (6,21)-(6,36)) (Var (Just (6,22)-(6,33)) "List.length") [Var (Just (6,34)-(6,35)) "t"]) (Lit (Just (6,39)-(6,40)) (LI 2))
App (Just (6,57)-(6,70)) (Var (Just (6,59)-(6,60)) "^") [Var (Just (6,57)-(6,58)) "a",App (Just (6,61)-(6,70)) (Var (Just (6,64)-(6,65)) "^") [Var (Just (6,62)-(6,63)) "x",Var (Just (6,66)-(6,69)) "sep"]]
*)

(* typed spans
(6,21)-(6,40)
(6,57)-(6,70)
*)

(* correct types
bool
string
*)

(* bad types
bool
unit
*)
