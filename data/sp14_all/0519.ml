
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" List.map f l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let x = List.map f l in sepConcat ";" x;;

*)

(* changed spans
(9,23)-(9,49)
let x = List.map f l in
sepConcat ";" x
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (9,23)-(9,62)) NonRec [(VarPat (Just (9,27)-(9,28)) "x",App (Just (9,31)-(9,43)) (Var (Just (9,31)-(9,39)) "List.map") [Var (Just (9,40)-(9,41)) "f",Var (Just (9,42)-(9,43)) "l"])] (App (Just (9,47)-(9,62)) (Var (Just (9,47)-(9,56)) "sepConcat") [Lit (Just (9,57)-(9,60)) (LS ";"),Var (Just (9,61)-(9,62)) "x"])
*)

(* typed spans
(9,23)-(9,62)
*)

(* correct types
string
*)

(* bad types
'a
*)
