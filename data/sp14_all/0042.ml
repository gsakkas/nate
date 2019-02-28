
let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (h1::t1,rh::rt) ->
          (t1, ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt))
      | _ -> ([], []) in
    let base = ((List.rev l1), [0]) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i mod 2 with
  | 0 ->
      (match i with
       | 0 -> []
       | 2 -> bigAdd l l
       | _ -> bigAdd (mulByDigit (i / 2) l) (mulByDigit (i / 2) l))
  | _ -> (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (h1::t1,rh::rt) -> (t1, ((bigAdd (mulByDigit x rh) rh) :: rt)) in
  let base = ((List.rev l1), [1]) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (h1::t1,rh::rt) ->
          (t1, ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt))
      | _ -> ([], []) in
    let base = ((List.rev l1), [0]) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i mod 2 with
  | 0 ->
      (match i with
       | 0 -> []
       | 2 -> bigAdd l l
       | _ -> bigAdd (mulByDigit (i / 2) l) (mulByDigit (i / 2) l))
  | _ -> (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (h1::t1,r) -> (t1, (bigAdd (mulByDigit h1 (List.append r [0])) r)) in
  let base = (l1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(43,4)-(44,68)
match a with
| (h1 :: t1 , r) -> (t1 , bigAdd (mulByDigit h1
                                             (List.append r
                                                          [0]))
                                 r)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(45,14)-(45,27)
l1
VarG

(45,29)-(45,32)
[]
ListG EmptyG

(46,13)-(46,24)
l2
VarG

*)

(* changed exprs
Case (Just (43,4)-(44,72)) (Var (Just (43,10)-(43,11)) "a") [(TuplePat (Just (44,7)-(44,15)) [ConsPat (Just (44,7)-(44,13)) (VarPat (Just (44,7)-(44,9)) "h1") (VarPat (Just (44,11)-(44,13)) "t1"),VarPat (Just (44,14)-(44,15)) "r"],Nothing,Tuple (Just (44,20)-(44,72)) [Var (Just (44,21)-(44,23)) "t1",App (Just (44,25)-(44,71)) (Var (Just (44,26)-(44,32)) "bigAdd") [App (Just (44,33)-(44,68)) (Var (Just (44,34)-(44,44)) "mulByDigit") [Var (Just (44,45)-(44,47)) "h1",App (Just (44,48)-(44,67)) (Var (Just (44,49)-(44,60)) "List.append") [Var (Just (44,61)-(44,62)) "r",List (Just (44,63)-(44,66)) [Lit (Just (44,64)-(44,65)) (LI 0)] Nothing]],Var (Just (44,69)-(44,70)) "r"]])]
Var (Just (45,14)-(45,16)) "l1"
List (Just (45,18)-(45,20)) [] Nothing
Var (Just (46,13)-(46,15)) "l2"
*)

(* typed spans
(43,4)-(44,72)
(45,14)-(45,16)
(45,18)-(45,20)
(46,13)-(46,15)
*)

(* correct types
(int list * int list)
int list
int list
'a list
*)

(* bad types
('a list * int list list)
'a list
int list
'a list
*)
