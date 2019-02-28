
let pipe fs =
  let f a x y z = z (fun r  -> y) in
  let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = let an = a in x in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,33)
let an = a in x
LetG NonRec (fromList [VarG]) VarG

*)

(* changed exprs
Let (Just (3,14)-(3,29)) NonRec [(VarPat (Just (3,18)-(3,20)) "an",Var (Just (3,23)-(3,24)) "a")] (Var (Just (3,28)-(3,29)) "x")
*)

(* typed spans
(3,14)-(3,29)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> (('b -> 'a) -> 'c) -> 'c
*)
