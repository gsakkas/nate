
let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match a with | hd::tl -> [cout (hd, i)] + (mulByDigit i tl) in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;


(* fix

let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match a with | hd::tl -> [cout (hd, i)] @ (mulByDigit i tl) in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;

*)

(* changed spans
(7,29)-(7,63)
[cout (hd , i)] @ mulByDigit i
                             tl
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (7,29)-(7,63)) (Var (Just (7,44)-(7,45)) "@") [List (Just (7,29)-(7,43)) [App (Just (7,30)-(7,42)) (Var (Just (7,30)-(7,34)) "cout") [Tuple (Just (7,35)-(7,42)) [Var (Just (7,36)-(7,38)) "hd",Var (Just (7,40)-(7,41)) "i"]]] Nothing,App (Just (7,46)-(7,63)) (Var (Just (7,47)-(7,57)) "mulByDigit") [Var (Just (7,58)-(7,59)) "i",Var (Just (7,60)-(7,62)) "tl"]]
*)

(* typed spans
(7,29)-(7,63)
*)

(* correct types
int list
*)

(* bad types
int
*)
