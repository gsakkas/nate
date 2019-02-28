
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = List.combine padZero l1 l2 in
    let base = failwith "to be implemented" in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let addition (x,y) = x + y;;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = x in
      let (y,z) = a in (((addition (m, n)) / 10), [(addition (m, n)) mod 10]) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(7,12)-(11,65)
fun (x , y) -> x + y
LamG (BopG EmptyG EmptyG)

(18,16)-(18,42)
let (m , n) = x in
let (y , z) = a in
(addition (m , n) / 10 , [addition (m , n) mod 10])
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,15)-(19,23)
addition
VarG

(19,15)-(19,43)
let (y , z) = a in
(addition (m , n) / 10 , [addition (m , n) mod 10])
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(20,4)-(21,51)
let base = (0 , [0]) in
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,15)-(20,23)
List.rev
VarG

(21,4)-(21,51)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* typed spans
(7,14)-(7,26)
(21,6)-(22,77)
(22,26)-(22,34)
(22,6)-(22,77)
(23,4)-(25,51)
(24,15)-(24,23)
(24,24)-(24,44)
*)

(* typed spans
(int * int) -> int
(int * int list)
(int * int) -> int
(int * int list)
int list
(int * int) list -> (int * int) list
(int * int) list
*)

(* typed spans
int list -> int list -> (int list * int list)
('a * int list)
string -> ('a * int list)
('a * int list)
int list
string -> 'a list
int list
*)
