
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile (fun x  -> ((b, ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile ((fun x  -> (b, ((f b) = b))), b);;

*)

(* changed spans
(6,28)-(6,61)
fun (f , b) ->
  wwhile (fun x ->
            (b , f b = b) , b)
LamG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Lam (Just (6,14)-(6,61)) (TuplePat (Just (6,14)-(6,17)) [VarPat (Just (6,14)-(6,15)) "f",VarPat (Just (6,16)-(6,17)) "b"]) (App (Just (6,21)-(6,61)) (Var (Just (6,21)-(6,27)) "wwhile") [Tuple (Just (6,28)-(6,61)) [Lam (Just (6,29)-(6,57)) (VarPat (Just (6,34)-(6,35)) "x") (Tuple (Just (6,40)-(6,56)) [Var (Just (6,41)-(6,42)) "b",Bop (Just (6,44)-(6,55)) Eq (App (Just (6,45)-(6,50)) (Var (Just (6,46)-(6,47)) "f") [Var (Just (6,48)-(6,49)) "b"]) (Var (Just (6,53)-(6,54)) "b")]) Nothing,Var (Just (6,59)-(6,60)) "b"]]) Nothing
*)

(* typed spans
(6,14)-(6,61)
*)

(* correct types
('a -> 'a * 'a) -> 'a
*)

(* bad types
'a -> (('b * bool) * 'b)
*)
