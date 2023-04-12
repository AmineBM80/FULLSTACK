<?php

class Personnage {
    private $nom;
    private $prenom;
    private $age;
    private $sexe;

    public function __construct($nom, $prenom, $age, $sexe) 
    {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->setAge($age);
        // $this->setSexe($sexe);
        $this->sexe = $sexe;
    }

    public function setAge($age)
    {
        if(is_int($age) && $age >= 1 && $age <= 10000)
        {
            $this->age = $age;
        }
        else
        {
            throw new Exception ("L'age du personnage doit un nombre entre 1 et 10000 !");
        }
    }

    // public function setSexe($sexe)
    // {
    //     if($sexe = "Homme" || $sexe = "Femme" || $sexe = "homme" || $sexe = "femme" )
    //     {
    //         $this->sexe = $sexe;
    //     }
    //     else
    //     {
    //         throw new Exception ("le sexe du personnage doit être 'Homme', 'homme', 'Femme' ou 'femme' ! ");
    //     }
    // }

    public function getAge()
    {
        return $this->age;
    }

    public function presentation()
    {
        var_dump ("Mon personnage est un(e) $this->sexe, et s'appelle $this->nom $this->prenom, et a $this->age ans");
    }
}

$monperso = new Personnage("Saluja", "Alibaba", 22, "Homme");

$monperso->presentation();

class Magasin {
    public $nom;
    public $adresse;
    public $codePostal;
    public $ville;
    public $modeRestauration;

    public function __construct($nom, $adresse, $codePostal, $ville, $modeRestauration) {
        $this->nom = $nom;
        $this->adresse = $adresse;
        $this->codePostal = $codePostal;
        $this->ville = $ville;
        $this->modeRestauration = $modeRestauration;
    }

    public function getModeRestauration() {
        return $this->modeRestauration;
    }
}


class Employe {
    private $nom;
    private $prenom;
    private $date_embauche;
    private $poste;
    private $salaire;
    private $service;
    private $magasin;
    private $enfants;


    public function __construct($nom, $prenom, $date_embauche, $fonction, $salaire, $service, $magasin, $enfants) {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->date_embauche = $date_embauche;
        $this->fonction = $fonction;
        $this->salaire = $salaire;
        $this->service = $service;
        $this->magasin = $magasin;
        $this->modeRestauration = $magasin->getModeRestauration();
        $this->enfants = $enfants;
    }

    public function getNom()
    {
        return $this->nom;
    }
    public function getPrenom()
    {
        return $this->prenom;
    }

    public function anciennete() {
        $now = new DateTime();
        $embauche = new DateTime($this->date_embauche);
        $diff = $embauche->diff($now);
        return $diff->y;
    }

    public function primeAnnuelle() {
        $prime = 0;
        $anciennete = $this->anciennete();
        $prime += $this->salaire * 0.05 * 1000; // 5% du salaire brut *1000 car on est en K€
        $prime += $this->salaire * ($anciennete * 0.02 * 1000); // 2% du salaire brut par année d'ancienneté
        return $prime;
    }

    public function ordreDeTransfert() {
        $date = date('Y-m-d');
        $prime = $this->primeAnnuelle();
        if ($date == '30-11') {
            // Envoyer l'ordre de transfert à la banque
            echo "Transfert de $prime € effectué le $date";
        } else {
            echo "La prime ne peut être versée qu'au 30 novembre";
        }
    }

    public function estEligibleChequesVacances() {
        $anneesAnciennete = $this->anciennete();
        if ($anneesAnciennete >= 1) {
            return true;
        } else {
            return false;
        }
    }
    

    public function prime_employe(){
        echo "$this->prenom  $this->nom : " . $this->primeAnnuelle(). "€  <br>";
    }

    public function aDroitChequesNoel() {
        $anciennete = $this->anciennete();
        return $anciennete >= 1;
    }

    public function getNombreChequesNoel() {
        $enfants = $this->enfants;
        $nombreCheques = array(
            '20' => 0,
            '30' => 0,
            '50' => 0
        );

        foreach ($enfants as $age) {
            if ($age <= 10) {
                $nombreCheques['20']++;
            } elseif ($age > 10 && $age <= 15) {
                $nombreCheques['30']++;
            } elseif ($age >16 && $age <= 18) {
                $nombreCheques['50']++;
            }
        }
        return $nombreCheques;
    }
}
// Création des magasins
$magasin1 = new Magasin('Magasin A', '1 Rue du Commerce', '75001', 'Paris', 'restaurant');
$magasin2 = new Magasin('Magasin B', '2 Rue de la République', '69002', 'Lyon', 'ticket restaurant');
$magasin3 = new Magasin('Magasin C', '3 Avenue des Champs-Élysées', '75008', 'Paris', 'ticket restaurant');

// Création des enfants
$enfantsemploye1 = array( 5, 12, 17);
$enfantsemploye2 = array( 17);
$enfantsemploye3 = array( 11, 12);
$enfantsemploye4 = 0;
$enfantsemploye5 = 0;

// Création des employés
$employes = array(
$employe1 = new Employe('Dupont', 'Jean', '2010-01-01', 'Comptable', 30, 'Comptabilité', $magasin1, $enfantsemploye1),
$employe2 = new Employe('Martin', 'Lucie', '2015-06-15', 'Commercial', 25, 'Ventes', $magasin3, $enfantsemploye2),
$employe3 = new Employe('Durand', 'Pierre', '2017-11-01', 'Ingénieur', 40, 'Technique', $magasin2, $enfantsemploye3),
$employe4 = new Employe('Lefebvre', 'Sophie', '2018-03-20', 'RH', 35, 'Ressources Humaines', $magasin3, $enfantsemploye4),
$employe5 = new Employe('Girard', 'François', '2020-09-10', 'Marketing', 28, 'Marketing', $magasin1, $enfantsemploye5),
);

// Affichage primes de chaque employé
echo "Montant des primes annuelles : <br> <br>";
$employe1->prime_employe();
$employe2->prime_employe();
$employe3->prime_employe();
$employe4->prime_employe();
$employe5->prime_employe();

echo "<br>";
echo "Chèques vacances : <br> <br>";

foreach ($employes as $employe) {
    echo "L'employé " . $employe->getNom() . " " . $employe->getPrenom() . " est ";
    if ($employe->estEligibleChequesVacances()) {
        echo "éligible aux chèques-vacances. <br>";
    } else {
        echo "non éligible aux chèques-vacances. <br>";
    }
}
