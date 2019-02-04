
let rec assoc (d,k,l) =
  match (d, k, l) with
  | (str,num)::t -> if str = k then num else assoc (d, k, t)
  | [] -> d;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | (ki,vi)::t -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;

*)

(* changed spans
(3,2)-(5,11)
EMPTY
EmptyG

(3,8)-(3,17)
EMPTY
EmptyG

(3,9)-(3,10)
EMPTY
EmptyG

(3,12)-(3,13)
match l with
| (ki , vi) :: t -> if k = ki
                    then vi
                    else assoc (d , k , t)
| [] -> d
CaseG VarG (fromList [(Nothing,VarG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(4,23)-(4,26)
EMPTY
EmptyG

(4,36)-(4,39)
ki
VarG

(4,45)-(4,60)
vi
VarG

*)
