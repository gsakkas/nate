
let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = let digits = digitsOfInt n in sumList digits;;

*)

(* changed spans
(10,32)-(10,53)
let digits = digitsOfInt n in
sumList digits
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (10,32)-(10,76)) NonRec [(VarPat (Just (10,36)-(10,42)) "digits",App (Just (10,45)-(10,58)) (Var (Just (10,45)-(10,56)) "digitsOfInt") [Var (Just (10,57)-(10,58)) "n"])] (App (Just (10,62)-(10,76)) (Var (Just (10,62)-(10,69)) "sumList") [Var (Just (10,70)-(10,76)) "digits"])
*)

(* typed spans
(10,32)-(10,76)
*)

(* correct types
int
*)

(* bad types
'a
*)
