
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile (let helper x = ((f x), ((f x) = (f b))) in ((helper b), b));;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), ((f x) = (f b))) in helper), b);;

*)

(* changed spans
(8,9)-(8,69)
(let helper =
   fun x -> (f x , f x = f b) in
 helper , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

*)

(* changed exprs
Tuple (Just (8,9)-(8,65)) [Let (Just (8,10)-(8,61)) NonRec [(VarPat (Just (8,15)-(8,21)) "helper",Lam (Just (8,22)-(8,50)) (VarPat (Just (8,22)-(8,23)) "x") (Tuple (Just (8,26)-(8,50)) [App (Just (8,27)-(8,32)) (Var (Just (8,28)-(8,29)) "f") [Var (Just (8,30)-(8,31)) "x"],Bop (Just (8,34)-(8,49)) Eq (App (Just (8,35)-(8,40)) (Var (Just (8,36)-(8,37)) "f") [Var (Just (8,38)-(8,39)) "x"]) (App (Just (8,43)-(8,48)) (Var (Just (8,44)-(8,45)) "f") [Var (Just (8,46)-(8,47)) "b"])]) Nothing)] (Var (Just (8,54)-(8,60)) "helper"),Var (Just (8,63)-(8,64)) "b"]
*)

(* typed spans
(8,9)-(8,65)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
(('a * bool) * 'b)
*)
