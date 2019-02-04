
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = seen in
        (if 1 = 2 then seen' := (h :: seen);
         (let rest' = t in helper (seen', rest'))) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let assignSeen h r seen = if List.mem h r then seen else h :: seen in
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = assignSeen h r seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(3,2)-(11,27)
let assignSeen =
  fun h ->
    fun r ->
      fun seen ->
        if List.mem h r
        then seen
        else h :: seen in
let rec helper =
  fun (seen , rest) ->
    match rest with
    | [] -> seen
    | h :: t -> (let r =
                   List.rev t in
                 let seen' =
                   assignSeen h r seen in
                 let rest' = t in
                 helper (seen' , rest')) in
List.rev (helper ([] , l))
LetG NonRec (fromList [LamG EmptyG]) (LetG Rec (fromList [EmptyG]) EmptyG)

(8,20)-(8,24)
EMPTY
EmptyG

(9,8)-(10,50)
EMPTY
EmptyG

(9,9)-(9,43)
EMPTY
EmptyG

(9,12)-(9,13)
EMPTY
EmptyG

(9,12)-(9,17)
EMPTY
EmptyG

(9,16)-(9,17)
EMPTY
EmptyG

(9,23)-(9,28)
EMPTY
EmptyG

(9,23)-(9,43)
EMPTY
EmptyG

(9,29)-(9,31)
EMPTY
EmptyG

(9,32)-(9,43)
assignSeen h r seen
AppG (fromList [VarG])

(9,33)-(9,34)
assignSeen
VarG

(9,38)-(9,42)
r
VarG

*)
