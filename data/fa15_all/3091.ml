
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = ((f x), ((f x not) = x)) in f'), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((let f' x = ((f x), (not ((f x) = x))) in f'), b);;

*)

(* changed spans
(4,49)-(4,64)
not (f x = x)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (5,30)-(5,47)) (Var (Just (5,31)-(5,34)) "not") [Bop (Just (5,35)-(5,46)) Eq (App (Just (5,36)-(5,41)) (Var (Just (5,37)-(5,38)) "f") [Var (Just (5,39)-(5,40)) "x"]) (Var (Just (5,44)-(5,45)) "x")]
*)

(* typed spans
(5,30)-(5,47)
*)

(* correct types
bool
*)

(* bad types
bool
*)
