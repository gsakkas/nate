
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
assignSeen h r seen
AppG (fromList [VarG])

(9,9)-(9,43)
EMPTY
EmptyG

(9,33)-(9,34)
assignSeen
VarG

(9,38)-(9,42)
r
VarG

*)

(* typed spans
(3,2)-(11,27)
(9,20)-(9,39)
(9,20)-(9,30)
(9,33)-(9,34)
*)

(* typed spans
'a list
'a list
'a -> 'a list -> 'a list -> 'a list
'a list
*)

(* typed spans
'a list
'a list
'a
'a list
*)
