
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " ["["; List.map f l; "]"];;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  sepConcat "; " (List.append ("[" :: (List.map f l)) ["]"]);;

*)

(* changed spans
(9,38)-(9,62)
List.append ("[" :: (List.map f
                              l)) ["]"]
AppG (fromList [ConAppG (Just EmptyG),ListG EmptyG])

*)

(* changed exprs
App (Just (10,17)-(10,60)) (Var (Just (10,18)-(10,29)) "List.append") [ConApp (Just (10,30)-(10,53)) "::" (Just (Tuple (Just (10,31)-(10,52)) [Lit (Just (10,31)-(10,34)) (LS "["),App (Just (10,38)-(10,52)) (Var (Just (10,39)-(10,47)) "List.map") [Var (Just (10,48)-(10,49)) "f",Var (Just (10,50)-(10,51)) "l"]])) Nothing,List (Just (10,54)-(10,59)) [Lit (Just (10,55)-(10,58)) (LS "]")] Nothing]
*)

(* typed spans
(10,17)-(10,60)
*)

(* correct types
string list
*)

(* bad types
string list
*)
