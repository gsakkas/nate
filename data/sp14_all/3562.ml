
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((h::i,j::k),(d::e,f::g)) -> ((f + d) / 10) :: ((h + j) mod 10) in
    let base = ([], []) in
    let args =
      List.rev
        (List.combine (List.map (fun x  -> [x]) l1)
           (List.map (fun x  -> [x]) l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match (a, x) with | ((b,c),(d,e)) -> (b, ((d + e) :: c)) in
    let base = ([], []) in
    let args = List.rev (List.combine [0; 0; 9; 9] [1; 0; 0; 2]) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,6)-(15,71)
match (a , x) with
| ((b , c) , (d , e)) -> (b , (d + e) :: c)
CaseG (TupleG (fromList [EmptyG])) (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(20,11)-(20,40)
[0 ; 0 ; 9 ; 9]
ListG LitG

(21,4)-(21,51)
[1 ; 0 ; 0 ; 2]
ListG LitG

*)

(* changed exprs
Case (Just (13,16)-(13,72)) (Tuple (Just (13,22)-(13,28)) [Var (Just (13,23)-(13,24)) "a",Var (Just (13,26)-(13,27)) "x"]) [(TuplePat (Just (13,38)-(13,47)) [TuplePat (Just (13,38)-(13,41)) [VarPat (Just (13,38)-(13,39)) "b",VarPat (Just (13,40)-(13,41)) "c"],TuplePat (Just (13,44)-(13,47)) [VarPat (Just (13,44)-(13,45)) "d",VarPat (Just (13,46)-(13,47)) "e"]],Nothing,Tuple (Just (13,53)-(13,72)) [Var (Just (13,54)-(13,55)) "b",ConApp (Just (13,57)-(13,71)) "::" (Just (Tuple (Just (13,58)-(13,70)) [Bop (Just (13,58)-(13,65)) Plus (Var (Just (13,59)-(13,60)) "d") (Var (Just (13,63)-(13,64)) "e"),Var (Just (13,69)-(13,70)) "c"])) Nothing])]
List (Just (15,38)-(15,50)) [Lit (Just (15,39)-(15,40)) (LI 0),Lit (Just (15,42)-(15,43)) (LI 0),Lit (Just (15,45)-(15,46)) (LI 9),Lit (Just (15,48)-(15,49)) (LI 9)] Nothing
List (Just (15,51)-(15,63)) [Lit (Just (15,52)-(15,53)) (LI 1),Lit (Just (15,55)-(15,56)) (LI 0),Lit (Just (15,58)-(15,59)) (LI 0),Lit (Just (15,61)-(15,62)) (LI 2)] Nothing
*)

(* typed spans
(13,16)-(13,72)
(15,38)-(15,50)
(15,51)-(15,63)
*)

(* correct types
('a list * int list)
int list
int list
*)

(* bad types
int list
int list list
int list
*)
