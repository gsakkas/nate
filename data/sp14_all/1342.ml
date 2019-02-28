
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = "" in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,23)-(7,73)
sepConcat sep t
AppG (fromList [VarG])

(7,23)-(7,73)
let l = t in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
App (Just (7,17)-(7,32)) (Var (Just (7,17)-(7,26)) "sepConcat") [Var (Just (7,27)-(7,30)) "sep",Var (Just (7,31)-(7,32)) "t"]
Let (Just (7,36)-(7,72)) NonRec [(VarPat (Just (7,40)-(7,41)) "l",Var (Just (7,44)-(7,45)) "t")] (App (Just (7,49)-(7,72)) (Var (Just (7,49)-(7,63)) "List.fold_left") [Var (Just (7,64)-(7,65)) "f",Var (Just (7,66)-(7,70)) "base",Var (Just (7,71)-(7,72)) "l"])
*)

(* typed spans
(7,17)-(7,32)
(7,36)-(7,72)
*)

(* correct types
string
string
*)

(* bad types
string
string
*)
