# Potoceanu Ana-Maria
## Tema 1: Metode Numerice

### Markov is coming...

#### - parse_labyrinth -
Pentru început, am implementat funcția `parse_labyrinth`, care primește ca parametru calea către un fișier text. După ce facem verificarea că fișierul a fost deschis cu succes, citim din fișier dimensiunile matricei care urmează să fie creată. Dimensiunile le vom citi de pe primul rând din fișier, mai exact: primul număr corespunde numărului de rânduri, iar al doilea numărului de coloane. Cream o matrice plină cu zerouri. Citim următoarele rânduri din fișier și folosim sintaxa `Labyrinth(k, :)` pentru a atribui valorile citite din fișier fiecărui rând din matricea `Labyrinth`. În final, închidem fișierul.

#### - get_adjacency_matrix -
În această funcție, am tratat separat cazurile când ne aflăm pe prima, respectiv ultima linie și pe prima, respectiv ultima coloană. Acest lucru a fost necesar deoarece starea de win se află fie la nord, fie la sud, iar starea de lose se află fie la est, fie la vest. Verificările le-am făcut cu ajutorul funcției bitand, ajutându-ne de numerele 8, 4, 2, 1:
- 8 -> 1000, indică un zid la nordul celulei
- 4 -> 0100, indică un zid la sudul celulei
- 2 -> 0010, indică un zid la estul celulei
- 1 -> 0001, indică un zid la vestul celulei

Functia returnează astfel matricea de adiacență.

#### - get_link_matrix -
În această funcție, ne folosim de o matrice auxiliară, care va fi matricea de adiacență. Unde întâlnim 1 în matricea de adiacență, vom înlocui cu probabilitatea. Probabilitatea se calculează ca `1 / suma`, unde suma este suma de pe linia corespunzătoare. Sumele le-am reținut într-un vector pentru a ne fi mai ușor.

#### - get_Jacobi_parameters -
Obținem dimensiunile matricei de legături. Matricea de iterație este asemănătoare matricei `Link`, doar că nu conține liniile și coloanele corespunzătoare stărilor win și lose. Vectorul de iterație îl vom selecta din matricea `Link`, fiind coloana corespunzătoare stării win. De asemenea, acesta va avea dimensiunea cu 2 mai puțin.

#### - perform_iterative -
În cadrul acestei funcții, am folosit implementarea prezentată la laborator. Mai exact, la fiecare pas calculăm `x` conform formulei și eroarea. În cazul în care am atins numărul maxim de pași sau dacă obținem o eroare mai mică decât toleranța, ne oprim. Vom reține de fiecare dată cine este `prev_x` și nu uităm în final să-i modificăm valoarea.

#### - heuristic_greedy -
Pentru a determina calea validă către starea WIN, ne vom folosi de un vector coloană în care reținem care vecini au fost vizitați sau nu. La început, se consideră că toți vecinii sunt nevizitați. Calea către starea WIN o reținem într-un vector coloană, denumit `path`. Adăugăm pe prima poziție a vectorului `path` poziția de start. Algoritmul funcționează cât timp avem vecini care nu au fost vizitați. În cazul în care toți vecinii au fost vizitați, ne oprim și eliminăm indexul din vector. Dacă am ajuns la starea WIN, ne oprim. Dacă vecinii nu au fost vizitați, determinăm care vecin are probabilitatea mai mare de câștig, conform vectorului `probabilities`. Se adaugă vecinul cu cea mai mare probabilitate în vector.

#### - decode_path -
Am creat un vector care va avea două coloane. Prima coloană este corespunzătoare indicilor pentru rânduri, iar a doua coloană pentru coloane. Selectăm pe rând din vectorul `path`, câte un element și îi vom calcula separat indicii. În final adăugăm perechea în vector.

### Linear Regression

#### - parse_data_set_file -
Deschidem fișierul și citim dimensiunile matricei de pe primul rând. Primul element de pe fiecare rând va fi adăugat în vectorul coloană `Y`, urmand ca celelalte elemente să fie adăugate în matrice. Facem verificarea dacă șirul citit este un număr sau nu. În cazul în care este număr, ne folosim de funcția `str2double` pentru a-l reține în matrice, în mod corespunzător.

#### - parse_csv_file -
În această funcție primim ca parametru calea către un fișier CSV. Deschidem fișierul și citim datele cu ajutorul funcției `textscan`. Această funcție ne permite să reținem întregul rând din fișier, care va fi distribuit astfel: primul element va fi adăugat în vectorul `Y`, iar celelalte elemente în `InitialMatrix`. Pentru a afla câte elemente avem pe o linie, ne ajutăm de `regexp`, care va pune fiecare element într-un vector. În acest fel, avem acces la toate elementele de pe fiecare linie. Elementele în matrice le vom pune ignorând `token{1}`, primul număr de pe linie.

#### - prepare_for_regression -
Am tratat cazurile când valoarea dintr-o celulă nu este un string. În acest caz, transformăm elementul în număr și îl adăugăm în matrice. De asemenea, am verificat dacă avem string-urile "yes" și "no". În acest caz, nu crește numărul de coloane al matricei. Se înlocuiește celula dată cu 1 pentru string-ul "yes" și cu 0 pentru string-ul "no". În ultimul caz, a fost nevoie să mutăm toate elementele începând cu poziția `j+1`, deoarece se va adăuga o nouă coloană și astfel evităm să suprascriem alte elemente.

#### - linear_regression_cost_function -
În această funcție, am implementat formula dată în cerința temei. Mai exact, pentru fiecare rând din matrice se calculează valoarea prezisă. Aceasta va fi produsul dintre rândul respectiv și vectorul coloană `Theta`, unde primul element se consideră 0. Se scade din valoarea prezisă ieșirea corespunzătoare. Rezultatul se ridică la pătrat și se adaugă la variabila `prod`. S-a calculat eroarea conform formulei prezentate.

#### - gradient_descent -
În această funcție, am inițializat vectorul `Theta` cu zerouri și avem nevoie de un vector coloană în care vom reține derivatele parțiale în raport cu fiecare coeficient. Se calculează valoarea prezisă, mai exact, înmulțim fiecare element de pe o linie cu coeficientul `theta` corespunzător. Calculăm suma conform formulei prezentate în enunț. Se calculează derivata parțială pe care o reținem într-un vector. `Theta` se calculează în funcție de parametrul `iter`. La fiecare pas vom scădea produsul `alpha * Delta(j)`. În final, am adăugat 0 la începutul vectorului `theta`, valoarea corespunzătoare pentru `theta 0`.

#### - normal_equation -
În această funcție, am implementat pseudocodul pus la dispoziție în cadrul temei. Matricea `A` din algoritm este de fapt `FeatureMatrix' * FeatureMatrix`. `X` este de fapt `Theta`, iar `b` se calculează ca `FeatureMatrix' * y`. Avem astfel ecuația `(FeatureMatrix' * FeatureMatrix) * Theta = FeatureMatrix' * y`. La început am verificat dacă matricea obținută prin produsul `FeatureMatrix' * FeatureMatrix` este pozitiv definită. Acest lucru a fost verificat cu ajutorul funcției `chol`. În cazul în care matricea nu era pozitiv definită, returnăm un vector coloană plin de zero pentru `Theta`. Am calculat `b` conform formulei și am inițializat vectorul `x0` cu zero. La fiecare pas am calculat termenii din pseudocod. De asemenea, am avut grijă să modificăm valoarea lui `rprev`, întrucât ne trebuie și cel anterior și cel actual. Algoritmul se oprește atunci când produsul dintre `rprev' * rprev` este mai mare decât toleranța ridicată la pătrat sau când ajungem la numărul maxim de pași.

#### - lasso_regression_cost_function -
În această funcție, am calculat pe rând pentru fiecare antrenament (rând), valoarea prezisă din care vom scădea ulterior ieșirea corespunzătoare. Calculăm norma vectorului `Theta`, iar în final am obținut eroarea conform formulei prezentate.

#### - ridge_regression_cost_function -
Am calculat primul termen din formula în același mod ca mai sus. De asemenea, pentru formula de la această funcție am avut nevoie de suma pătratelor fiecărui coeficient.

### MNIST 101

#### - load_dataset -
Deschidem fișierul și salvăm toate datele din el într-o variabilă, cu ajutorul funcției `load`. Matricei `X` îi atribuim câmpul `X` care se găsește în fișierul dat, iar vectorului `y` îi atribuim câmpul corespunzător.

#### - split_dataset -
Vom genera o ordine random pentru rândurile din matrice, folosind funcția `randperm`. Reținem matricea și vectorul care conțin liniile interschimbate. Calculăm numărul de linii care va fi adăugat în `X_train`, respectiv în `y_train`. Primele `p` linii se vor pune în `X_train`, iar celelalte vor fi adăugate în `X_test`, de asemenea, la fel se procedează și pentru `y_test` și pentru `y_train`.

#### - initialize_weights -
Calculăm cu ajutorul formulei prezentate numărul `e`. Vom genera o matrice cu elemente aleatorii care se află în intervalul `(-e, e)`. Acest lucru l-am implementat cu ajutorul funcției `rand`.
