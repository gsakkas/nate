
let f' (f,b) = (f b) = b;;

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' x = if (f x) = b then (b, true) else ((f' x), false) in f' 1),
      b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' x = if (f x) = b then (b, true) else ((f x), false) in f'), b);;

*)

(* changed spans
(4,16)-(5,63)
match f b with
| (h1 , h2) -> if h2
               then wwhile (f , h1)
               else h1
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(9,52)-(9,54)
f
VarG

(9,69)-(9,73)
f'
VarG

*)

(* changed exprs
Case (Just (3,2)-(3,63)) (App (Just (3,8)-(3,11)) (Var (Just (3,8)-(3,9)) "f") [Var (Just (3,10)-(3,11)) "b"]) [(TuplePat (Just (3,20)-(3,25)) [VarPat (Just (3,20)-(3,22)) "h1",VarPat (Just (3,23)-(3,25)) "h2"],Nothing,Ite (Just (3,30)-(3,63)) (Var (Just (3,33)-(3,35)) "h2") (App (Just (3,41)-(3,55)) (Var (Just (3,41)-(3,47)) "wwhile") [Tuple (Just (3,48)-(3,55)) [Var (Just (3,49)-(3,50)) "f",Var (Just (3,52)-(3,54)) "h1"]]) (Var (Just (3,61)-(3,63)) "h1"))]
Var (Just (7,52)-(7,53)) "f"
Var (Just (7,68)-(7,70)) "f'"
*)

(* typed spans
(3,2)-(3,63)
(7,52)-(7,53)
(7,68)-(7,70)
*)

(* correct types
'a
'a -> 'a
'a -> ('a * bool)
*)

(* bad types
(bool -> (bool * bool) * bool) -> bool
('a -> 'a * 'a) -> bool
bool -> (bool * bool)
*)
