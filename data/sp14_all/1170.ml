
let getHead b = match b with | [] -> [] | x::xs -> x;;

let rec listReverse l =
  let a = [] in
  let getHead b = match b with | [] -> [] | x::xs -> x :: (a getHead xs) in
  getHead l;;


(* fix

let rec listReverse l =
  let rec getList a b = match a with | [] -> [] in getList [] l;;

*)

(* changed spans
(5,2)-(7,11)
let rec getList =
  fun a ->
    fun b ->
      match a with
      | [] -> [] in
getList [] l
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (3,2)-(3,63)) Rec [(VarPat (Just (3,10)-(3,17)) "getList",Lam (Just (3,18)-(3,47)) (VarPat (Just (3,18)-(3,19)) "a") (Lam (Just (3,20)-(3,47)) (VarPat (Just (3,20)-(3,21)) "b") (Case (Just (3,24)-(3,47)) (Var (Just (3,30)-(3,31)) "a") [(ConPat (Just (3,39)-(3,41)) "[]" Nothing,Nothing,List (Just (3,45)-(3,47)) [] Nothing)]) Nothing) Nothing)] (App (Just (3,51)-(3,63)) (Var (Just (3,51)-(3,58)) "getList") [List (Just (3,59)-(3,61)) [] Nothing,Var (Just (3,62)-(3,63)) "l"])
*)

(* typed spans
(3,2)-(3,63)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
