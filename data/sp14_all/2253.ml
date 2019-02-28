
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((fun (f,b)  -> match f b with | b -> ((f b), false) | _ -> ((f b), true)),
      b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun a  -> if b = (f b) then (b, false) else ((f b), true)), b);;

*)

(* changed spans
(7,5)-(7,78)
fun a ->
  if b = f b
  then (b , false)
  else (f b , true)
LamG (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Lam (Just (6,10)-(6,69)) (VarPat (Just (6,15)-(6,16)) "a") (Ite (Just (6,21)-(6,68)) (Bop (Just (6,24)-(6,33)) Eq (Var (Just (6,24)-(6,25)) "b") (App (Just (6,28)-(6,33)) (Var (Just (6,29)-(6,30)) "f") [Var (Just (6,31)-(6,32)) "b"])) (Tuple (Just (6,39)-(6,49)) [Var (Just (6,40)-(6,41)) "b",Lit (Just (6,43)-(6,48)) (LB False)]) (Tuple (Just (6,55)-(6,68)) [App (Just (6,56)-(6,61)) (Var (Just (6,57)-(6,58)) "f") [Var (Just (6,59)-(6,60)) "b"],Lit (Just (6,63)-(6,67)) (LB True)])) Nothing
*)

(* typed spans
(6,10)-(6,69)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a -> 'a * 'a) -> ('a * bool)
*)
