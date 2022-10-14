for ligne in `cat Users\33627\scripts\job9`;
do 
id=`echo ${ligne} | cut -d "," -f 1`
prenom=`echo ${ligne} | cut -d "," -f 2`
nom= `echo ${ligne} | cut -d "," -f 3`
mdp= `echo ${ligne} | cut -d "," -f 4`
role= `echo ${ligne} | cut -d "," -f 5`
echo "$mdp" 
mdpc=$(perl -e 'print crypt ($ARGV[0], "salt")', $mdp) 
echo "$mdpc"
runas useradd -m -p $mdpc $prenom-$nom

echo "$role"
if [[ "$role" =~ .*Admin.* ]] 
then 
echo "Ajout de l'utilisateur à la table des administrateurs"
runas adduser $prenom-$nom runas
runas adduser $prenom-$nom adm 
echo "admin ajouté" 
else
echo "l'utilisateur n'est que $role" 
fi
done 
exit 0 



