(* Kai Geffen March 11 2017 *)
(* My version of the key-graph data type introduced in: *)
(* "Secure Group Communications Using Key Graphs" by Chung Kei Wong, Member, IEEE, Mohamed Gouda, and Simon S. Lam, Fellow, IEEE *)

(* ocamlc -o main main.ml; ./main *)

type user = string
type key = int
type userSet = user list
type keySet = key list
type userKeyRelation = (user * key) list
type secureGroup = (userSet * keySet * userKeyRelation)

(* Get set of all keys that a given user has access to in the given relation *)
let rec getKeySet (u : user) (r : userKeyRelation) : keySet = match r with
  | (uh, kh) :: t -> if u==uh then [kh]@(getKeySet u t) else (getKeySet u t)
  | _ -> []

(* Get set of all users in the given relation with access to a given key *)
let rec getUserSet (k : key) (r : userKeyRelation) : userSet = match r with
  | (uh, kh) :: t -> if k==kh then [uh]@(getUserSet k t) else (getUserSet k t)
  | _ -> []

let _ = 
  (* Inline for ease *)
  let u1 : user = "Alice" in
  let u2 : user = "Bob" in
  let u3 : user = "Charlie" in
  let uSet : userSet = [u1;u2;u3] in

  let k1 : key = 111 in
  let k2 : key = 234 in
  let k3 : key = 331 in
  let kg : key = 478 in
  let kSet : keySet = [k1;k2;k3;kg] in

  let r : userKeyRelation = [(u1,k1);(u1,kg);(u2,k2);(u2,kg);(u3,k3);(u3,kg);] in

  let res : keySet = (getKeySet u1 r) in
  let resSize : int = (List.length res) in
  
  print_int resSize;
  print_string "\n"
