
let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base List.rev fs;;


(* fix

let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(3,37)-(3,70)
List.fold_left f base
               (List.rev fs)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (3,37)-(3,72)) (Var (Just (3,37)-(3,51)) "List.fold_left") [Var (Just (3,52)-(3,53)) "f",Var (Just (3,54)-(3,58)) "base",App (Just (3,59)-(3,72)) (Var (Just (3,60)-(3,68)) "List.rev") [Var (Just (3,69)-(3,71)) "fs"]]
*)

(* typed spans
(3,37)-(3,72)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a
*)
