
let t x = x + 1;;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map sepConcat f l;;


(* fix

let t x = x + 1;;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let nl = List.map f l in sepConcat "" nl;;

*)

(* changed spans
(11,23)-(11,45)
let nl = List.map f l in
sepConcat "" nl
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (11,23)-(11,63)) NonRec [(VarPat (Just (11,27)-(11,29)) "nl",App (Just (11,32)-(11,44)) (Var (Just (11,32)-(11,40)) "List.map") [Var (Just (11,41)-(11,42)) "f",Var (Just (11,43)-(11,44)) "l"])] (App (Just (11,48)-(11,63)) (Var (Just (11,48)-(11,57)) "sepConcat") [Lit (Just (11,58)-(11,60)) (LS ""),Var (Just (11,61)-(11,63)) "nl"])
*)

(* typed spans
(11,23)-(11,63)
*)

(* correct types
string
*)

(* bad types
'a
*)
