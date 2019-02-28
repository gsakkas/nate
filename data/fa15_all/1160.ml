
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let y x = List.map f l in sepConcat "[" y;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let fix l x = List.map f l in sepConcat "[" l;;

*)

(* changed spans
(9,23)-(9,64)
let fix =
  fun l ->
    fun x -> List.map f l in
sepConcat "[" l
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (9,23)-(9,68)) NonRec [(VarPat (Just (9,27)-(9,30)) "fix",Lam (Just (9,31)-(9,49)) (VarPat (Just (9,31)-(9,32)) "l") (Lam (Just (9,33)-(9,49)) (VarPat (Just (9,33)-(9,34)) "x") (App (Just (9,37)-(9,49)) (Var (Just (9,37)-(9,45)) "List.map") [Var (Just (9,46)-(9,47)) "f",Var (Just (9,48)-(9,49)) "l"]) Nothing) Nothing)] (App (Just (9,53)-(9,68)) (Var (Just (9,53)-(9,62)) "sepConcat") [Lit (Just (9,63)-(9,66)) (LS "["),Var (Just (9,67)-(9,68)) "l"])
*)

(* typed spans
(9,23)-(9,68)
*)

(* correct types
string
*)

(* bad types
'a
*)
