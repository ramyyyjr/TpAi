:- dynamic tache/4.

creer_tache(Id, Desc, Assign) :-
    \+ tache(Id, _, _, _),
    assertz(tache(Id, Desc, Assign, false)),
    format("Tâche créée : ~w.~n", [Id]).

assigner_tache(Id, NouveauAssign) :-
    retract(tache(Id, Desc, _, Statut)),
    assertz(tache(Id, Desc, NouveauAssign, Statut)),
    format("Tâche ~w assignée à l’utilisateur : ~w.~n", [Id, NouveauAssign]).

marquer_terminee(Id) :-
    retract(tache(Id, Desc, Assign, _)),
    assertz(tache(Id, Desc, Assign, true)),
    format("Tâche ~w marquée comme terminée.~n", [Id]).

afficher_taches :-
    forall(tache(Id, Desc, Assign, Statut),
           (format("Tâche ~w :~n- Description : ~w~n- Assigné : ~w~n- Statut de complétion : ~w~n~n",
                   [Id, Desc, Assign, Statut]))).

afficher_taches_assignee_(Assign) :-
    format("Tâches assignées à ~w :~n", [Assign]),
    forall(tache(Id, Desc, Assign, Statut),
           (format("Tâche ~w :~n- Description : ~w~n- Statut de complétion : ~w~n~n",
                   [Id, Desc, Statut]))).

afficher_taches_terminees :-
    format("Tâches terminées :~n"),
    forall(tache(Id, Desc, Assign, true),
           (format("Tâche ~w :~n- Description : ~w~n- Assigné : ~w~n~n",
                   [Id, Desc, Assign]))).
