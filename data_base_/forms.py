from flask_wtf import FlaskForm,RecaptchaField, Recaptcha
from flask_wtf.file import FileField, FileAllowed
from flask_login import current_user
from wtforms import StringField,PasswordField,SubmitField,BooleanField,SelectField, IntegerField
from wtforms.validators import DataRequired,length,Email,EqualTo,ValidationError
from Database_project.project.data_base_.Models import Expert ,Client
from wtforms.fields.html5 import DateField





class RegistrationForm(FlaskForm):
    username =StringField("Identifiant",
                                validators=[DataRequired(),length(min=4 ,max=20)])
    
    Numero =StringField('Tel',
                                validators=[DataRequired(),length(min=4 ,max=20)])

    email =StringField('E-mail',
                           validators=[DataRequired(),Email()])

    password =PasswordField('Mot de pass',
                                  validators=[length(min=8 ,max=20)])
    confirm_password =PasswordField('Confirmer le mot de pass',
                                  validators=[EqualTo('password')])

    Type_Expert=SelectField('Type d\'expert',
                             choices=[('Interv', 'Interv'), ('CONCESS', 'CONCESS'), ('agent Cell Dev', 'agent Cell Dev'),('Interv', 'Interv'),('Suiveur Cell Tech', 'Suiveur Cell Tech'),('Suiveur Cell Planif', 'Suiveur Cell Planif'),('Admin', 'Admin'),('Audit', 'Audit')])

    Sexe=SelectField('Sexe',
                             choices=[('MME', 'MME'), ('M.', 'M.')])

    submit = SubmitField('enregistrer')

    modifier = SubmitField('modifier')
    
    def validate_username(self,username): 
        user = Expert.query.filter_by(nom=username.data).first()

        if user:
            raise ValidationError("Ce nom d'utilisateur est pris. Veuillez choisir un autre nom")

    def validate_email(self,email):
        email = Expert.query.filter_by(email=email.data).first()

        if email:
            raise ValidationError('Cet e-mail est déjà utilisé par un autre utilisateur')


class Expert_editForm(FlaskForm):
    username =StringField("Identifiant",
                                validators=[DataRequired(),length(min=4 ,max=20)])
    
    Numero =StringField('Tel',
                                validators=[DataRequired(),length(min=4 ,max=20)])

    email =StringField('E-mail',
                           validators=[DataRequired(),Email()])


    Sexe=SelectField('Sexe',
                             choices=[('MME', 'MME'), ('M.', 'M.')])

    siret =StringField('siret',
                                  validators=[DataRequired()])

    trigramme =StringField('trigramme',
                                validators=[DataRequired()])

    code_tva =StringField('code_tva',
                            validators=[DataRequired()])
                        
    taux_tva =StringField('taux_tva',
                            validators=[DataRequired()])

    actif_parti =SelectField('actif_parti',
                            choices=[('Actif'), ('Parti')])

    ville =StringField('ville',
                        validators=[DataRequired()])
    
    type_certification=StringField('type_certification',
                        validators=[DataRequired()])
    adresse=StringField('adresse',
                        validators=[DataRequired()])
    cp=StringField('cp',
                        validators=[DataRequired()])
    login_backof=StringField('login_backof',
                        validators=[DataRequired()])
    pwd_backof=StringField('pwd_backof',
                        validators=[DataRequired()]) #endeavour to hash all passwords
    login_extranet=StringField('login_extranet',
                        validators=[DataRequired()])
    pwd_extranet=StringField('pwd_extranet',
                        validators=[DataRequired()])
    pwd_gsuite=StringField('pwd_gsuite',
                        validators=[DataRequired()])
    observations_de_suivi=StringField('observations_de_suivi',
                        validators=[DataRequired()])

    modifier = SubmitField('modifier')

class RequestResetForm(FlaskForm):
    email =StringField('Email',
                           validators=[DataRequired(),Email()])
    submit = SubmitField('Request Password Reset')

    recaptcha = RecaptchaField(validators=[Recaptcha(message="Le reCAPTCHA n'a pas été saisi correctement. Revenez en arrière et essayez à nouveau.")])

    def validate_username(self,username):
        user = Expert.query.filter_by(EMAIL=email.data).first()## add visibility

        if user is None:
            raise ValidationError('There is no account with this email.You must register first.')

class ResetPasswordForm(FlaskForm):
    password =PasswordField('Password',
                                  validators=[DataRequired(),length(min=8 ,max=20)])
    confirm_password =PasswordField('ConfirmPassword',
                                  validators=[DataRequired(),EqualTo('password')])
    submit = SubmitField('Reset password')
class LoginForm(FlaskForm):
    username =StringField("Identifiant",
                                     validators=[DataRequired(),length(min=4 ,max=20, message='Le champ est obligatoire')])

    password =PasswordField('Mot de passe',
                                  validators=[DataRequired(),length(min=4 ,max=20, message="Le champ doit comporter entre 4 et 20 caractères.")])

    recaptcha = RecaptchaField(validators=[Recaptcha(message="Le reCAPTCHA n'a pas été saisi correctement. Revenez en arrière et essayez à nouveau.")])
    remember = BooleanField('Remember me')                              
    submit = SubmitField('Se connecter')
    
class tableform(FlaskForm):
        table =StringField('table',validators=[DataRequired()])

        submit = SubmitField('Recherchez')



class Tarif_Form(FlaskForm):

  type_maison = SelectField('Type', choices=[('F1', 'F1'), ('F2', 'F2'),('F3', 'F3'),('F4', 'F4'),('F5', 'F5')])

  maison_appartement=SelectField('M/A', choices=[('Maison', 'Maison'), ('Appartement', 'Appartement')])

  Prix_EDL= StringField('Prix_EDL', validators=[DataRequired()])

  Prix_Chiffrage= StringField('Prix_Chiffrage', validators=[DataRequired()])

  code_tva= StringField('code_tva', validators=[DataRequired()])

  ID_Cell_AS_referent_client= StringField('ID_Cell_AS_referent_client', validators=[DataRequired()])

  Cell_AS_referent_client_taux_com=StringField('Cell_AS_referent_client_taux_com', validators=[DataRequired()])

  ID_Cell_devel_client = StringField('ID_Cell_devel_client', validators=[DataRequired()])

  Cell_devel_respon_client_taux_com = StringField('Cell_devel_respon_client_taux_com', validators=[DataRequired()])

  ID_Cell_devel_agent_suivi_client = StringField('ID_Cell_devel_agent_suivi_client', validators=[DataRequired()])

  Cell_devel_agent_suivi_client_taux_com = StringField('Cell_devel_agent_suivi_client_taux_com', validators=[DataRequired()])

  ID_Cell_tech_Ref_agent_suivi_client = StringField('ID_Cell_tech_Ref_agent_suivi_client', validators=[DataRequired()])

  Cell_tech_Ref_respon_suivi_client_taux_com = StringField('Cell_tech_Ref_respon_suivi_client_taux_com', validators=[DataRequired()])

  ID_Cell_tech_Ref_suiveur_client = StringField('ID_Cell_tech_Ref_suiveur_client', validators=[DataRequired()])

  Cell_tech_Ref_suiveur_taux_com = StringField('Cell_tech_Ref_suiveur_taux_com', validators=[DataRequired()])

  ID_Cell_Planif_Ref_respon_client = StringField('ID_Cell_Planif_Ref_respon_client', validators=[DataRequired()])

  Cell_Planif_Ref_respon_taux_com = StringField('Cell_Planif_Ref_respon_taux_com', validators=[DataRequired()])

  ID_Cell_Planif_Ref_suiveur_client = StringField('ID_Cell_Planif_Ref_suiveur_client', validators=[DataRequired()])

  Cell_Planif_Ref_suiveur_taux_com = StringField('Cell_Planif_Ref_suiveur_taux_com', validators=[DataRequired()])

  ID_Cell_Planif_Ref_agent_client = StringField('ID_Cell_Planif_Ref_agent_client', validators=[DataRequired()])

  Cell_Planif_Ref_agent_taux_com  =  StringField('Cell_Planif_Ref_suiveur_taux_com', validators=[DataRequired()])

  commentaire_libre = StringField('commentaire_libre', validators=[DataRequired()])
  

  submit = SubmitField('enregistrer')

  modifier = SubmitField('modifier')

class Facturation_Form(FlaskForm):
    Reference_client=StringField('Reference_client',
                           render_kw={'readonly':True})

    Demarrer=StringField('Demarrer',
                           render_kw={'readonly':True})

    Fin=StringField('Fin',
                           render_kw={'readonly':True})
    
    Montant_HT =StringField('Montant_HT',
                           validators=[DataRequired()])

    Montant_TTC =StringField('Montant_TTC',
                           validators=[DataRequired()])    

    TTC =StringField('TTC',
                           validators=[DataRequired()])

    Date_reglement_client=DateField("Date_reglement_client")

    
    Statut=SelectField('Statut',
                             choices=[('paye', 'paye'), ('attente', 'attente')])
    
    Observations_suivi_paiement=SelectField('Type_',
                             choices=[('Entrant', 'Entrant'), ('Sortant', 'Sortant')])

    
    Email_de_relance=StringField('Email_de_relance',
                           validators=[DataRequired()])


    submit = SubmitField('enregistrer')


class Client_Form(FlaskForm):
    
    Type=SelectField('Type',
                             choices=[('BAILLEUR', 'Bailleur'), ('LOCATAIRE', 'Locataire')])

    Societe =StringField('Societe',
                           validators=[DataRequired()])

    Sexe=SelectField('Sexe',
                             choices=[('femelle', 'femelle'), ('male', 'male')])

    NOM =StringField('Noms',
                           validators=[DataRequired()])
    
    email =StringField('E-mail',
                           validators=[DataRequired(),Email()])

    Numero =StringField('Tel',
                           validators=[DataRequired()])

    Adresse=StringField('Adresse ',
                           validators=[DataRequired()])

    CP=StringField('Code Postal',
                           validators=[DataRequired()])
    
    Ville=StringField('Ville',
                           validators=[DataRequired()])
    
    Siret=StringField("Siret N°",
                           validators=[DataRequired()])

    Pays=SelectField("Pays ", choices=[('France', 'France'), ('Belgique', 'Belgique')],
                        validators=[DataRequired()])

    submit = SubmitField('enregistrer')

    modifier = SubmitField('modifier')



    def validate_username(self,username):
        user = Client.query.filter_by(nom=username.data).first()

        if user:
            raise ValidationError("Ce nom d'utilisateur est pris. Veuillez choisir un autre nom")

    def validate_email(self,email):
        email = Client.query.filter_by(email=email.data).first()

        if email:
            raise ValidationError('Cet e-mail est déjà utilisé par un autre utilisateur')



class Suivi_Client(FlaskForm):

    commentaire=StringField("commentaire",
                        validators=[DataRequired()])
    submit = SubmitField('enregistrer')


class Mission_add(FlaskForm):

    Reference_client=StringField("N° Client",
                        validators=[DataRequired()])

    ID_Concessionaire=StringField("N° Concessionaire",
                        validators=[DataRequired()])
   
    submit = SubmitField('enregistrer')


class Mission_editForm(FlaskForm):

    NRO_FACTURE=StringField("N° Facture",
                        validators=[DataRequired()])
    DATE_REALISE_EDL=StringField("Date de realisation EDL",
                        validators=[DataRequired()])
    PRIX_HT_EDL=StringField("Prix HT EDL",
                        validators=[DataRequired()])
    TVA_EDL=StringField("TVA EDL",
                        validators=[DataRequired()])
    PRIX_TTC_EDL=StringField("Prix TTC EDL",
                        validators=[DataRequired()])
    ID_INTERV=StringField("N° INTERV",
                        validators=[DataRequired()])
    Reference_LOCATAIRE=StringField("N° Locataire",
                        validators=[DataRequired()])
    CA_HT_AS=StringField("CA HT AS",
                        validators=[DataRequired()])
    TVA_AS=StringField("TVA AS",
                        validators=[DataRequired()])
    CA_TTC_AS=StringField("CA TTC AS",
                        validators=[DataRequired()])
    CA_HT_AC=StringField("CA HT AC",
                        validators=[DataRequired()])
    CA_TTC_AC=StringField("CA TTC AC",
                        validators=[DataRequired()])
    CA_HT_TRUST=StringField("CA HT TRUST",
                        validators=[DataRequired()])	
    TVA_TRUST=StringField("TVA TRUST",
                        validators=[DataRequired()])
    Date_chiffrage_regle=StringField("Date_chiffrage_regle", 
                        validators=[DataRequired()])
    Prix_ht_chiffrage=StringField("Prix_ht_chiffrage",
                        validators=[DataRequired()])
    POURCENTAGE_suiveur_chiffrage=StringField("POURCENTAGE_suiveur_chiffrage",
                        validators=[DataRequired()])
    POURCENTAGE_AS_chiffrage=StringField("POURCENTAGE_AS_chiffrage",
                        validators=[DataRequired()])
    POURCENTAGE_manager_chiffrage=StringField("POURCENTAGE_manager_chiffrage",
                        validators=[DataRequired()])
    ID_manager_chiffrage =StringField("ID_manager_chiffrage",
                        validators=[DataRequired()])
    POURCENTAGE_agent_chiffrage =StringField("POURCENTAGE_agent_chiffrage",
                        validators=[DataRequired()])
    ID_agent_chiffrage =StringField("ID_agent_chiffrage",
                        validators=[DataRequired()])
    TYPE_EDL =StringField("TYPE EDL",
                        validators=[DataRequired()])  	
    DATE_FACTURE =StringField("Date de Facture",
                        validators=[DataRequired()])  	
    NOMPROPRIO =StringField("Nom du Proprio",
                        validators=[DataRequired()])  	
    DATE_FACT_REGLEE =StringField("Date de paiement de la facture",
                        validators=[DataRequired()])  	
    DATE_COM_REGLEE_AS =StringField("DATE_COM_REGLEE_AS",
                        validators=[DataRequired()])  	
    MONTANT_COM_REGLEE_AS =StringField("MONTANT_COM_REGLEE_AS",
                        validators=[DataRequired()])   	
    DATE_COM_REGLEE_AC =StringField("DATE_COM_REGLEE_AC",
                        validators=[DataRequired()])  	
    MONTANT_COM_REGLEE_AC = StringField("MONTANT_COM_REGLEE_AC",
                        validators=[DataRequired()]) 	
    TYPE_LOGEMENT =  StringField("TYPE_LOGEMENT",
                        validators=[DataRequired()])	
    NBRE_EDL_ABOONEMENT =  StringField("NBRE_EDL_ABOONEMENT",
                        validators=[DataRequired()])	
    MAIL_CONTACT_ENVOI_FACT = StringField("MAIL_CONTACT_ENVOI_FACT",
                        validators=[DataRequired()]) 	
    DATE_saisie_enregistrement =  StringField("DATE_saisie_enregistrement",
                        validators=[DataRequired()])
    CODE_AMEXPERT =  StringField("CODE_AMEXPERT",
                        validators=[DataRequired()])	
    COMMENTAIRE_FACTURE = StringField("COMMENTAIRE_FACTURE",
                        validators=[DataRequired()]) 	
    TYPE_PAIEMENT = StringField("TYPE_PAIEMENT",
                        validators=[DataRequired()]) 	
    N_REMISE_DE_CHEQUE = StringField("N_REMISE_DE_CHEQUE",
                        validators=[DataRequired()]) 	
    SAISIE_TRAITE_PAR =  StringField("SAISIE_TRAITE_PAR",
                        validators=[DataRequired()])	
    infos_et_TRAITEMENT =  StringField("infos_et_TRAITEMENT",
                        validators=[DataRequired()])	
    LOGEMENT_MEUBLE = StringField("LOGEMENT_MEUBLE",
                        validators=[DataRequired()]) 	
    CODE_FACTURATION =StringField("CODE_FACTURATION",
                        validators=[DataRequired()])  	
    TYPE_DE_BIEN = StringField("TYPE_DE_BIEN",
                        validators=[DataRequired()]) 	
    surface_logement1 = StringField("surface_logement1",
                        validators=[DataRequired()]) 	
    ETAGE = StringField("ETAGE",
                        validators=[DataRequired()]) 	
    POINTAGE = StringField("POINTAGE",
                        validators=[DataRequired()]) 	
    DATE_POINTAGE = StringField("DATE_POINTAGE",
                        validators=[DataRequired()]) 	
    DEVEL = StringField("DEVEL",
                        validators=[DataRequired()]) 	
    DATE_EXTRACTION_COMPTABLE = StringField("DATE_EXTRACTION_COMPTABLE",
                        validators=[DataRequired()]) 	
    POURCENTAGE_COM_AS_DU_CLIENT = StringField("POURCENTAGE_COM_AS_DU_CLIENT",
                        validators=[DataRequired()])
    ID_Respon_Cell_Dev	 = StringField("ID_Respon_Cell_Dev",
                        validators=[DataRequired()])
    POURCENTAGE_Respon_Cell_Dev =  StringField("POURCENTAGE_Respon_Cell_Dev",
                        validators=[DataRequired()])	
    ID_agent_Cell_Dev = StringField("ID_agent_Cell_Dev",
                        validators=[DataRequired()])
    POURCENTAGE_Agent_Cell_Dev =  StringField("POURCENTAGE_Agent_Cell_Dev",
                        validators=[DataRequired()])	
    ID_Agent_CellTech =  StringField("ID_Agent_CellTech",
                        validators=[DataRequired()])	
    POURCENTAGE_Agent_Cell_Tech =  StringField("POURCENTAGE_Agent_Cell_Tech",
                        validators=[DataRequired()])	
    ID_Respon_Cell_Tech = StringField("ID_Respon_Cell_Tech",
                        validators=[DataRequired()])
    POURCENTAGE_Respon_Cell_Tech =  StringField("POURCENTAGE_Respon_Cell_Tech",
                        validators=[DataRequired()])	
    ID_Suiveur_Cell_Tech  =  StringField("ID_Suiveur_Cell_Tech",
                        validators=[DataRequired()])
    POURCENTAGE_Suiveur_Cell_Tech	=  StringField("POURCENTAGE_Suiveur_Cell_Tech",
                        validators=[DataRequired()])
    ID_Respon_Cell_Planif = StringField("ID_Respon_Cell_Planif",
                        validators=[DataRequired()])
    POURCENTAGE_Respon_Cell_Planif  =  StringField("POURCENTAGE_Respon_Cell_Planif",
                        validators=[DataRequired()])	
    ID_Suiveur_Cell_Planif  = StringField("ID_Suiveur_Cell_Planif",
                        validators=[DataRequired()])
    POURCENTAGE_Suiveur_Cell_Planif	 =  StringField("POURCENTAGE_Suiveur_Cell_Planif",
                        validators=[DataRequired()])
    ID_Agent_saisie_Cell_Planif  = StringField("ID_Agent_saisie_Cell_Planif",
                        validators=[DataRequired()])
    POURCENTAGE_Agent_saisie_CEll_planif  =  StringField("POURCENTAGE_Agent_saisie_CEll_planif",
                            validators=[DataRequired()])

    modifier = SubmitField('enregistre')



class Agenda_form(FlaskForm):

    Titre_du_Rdv=StringField("Titre_du_Rdv",
                        validators=[DataRequired()])

    Adresse1_Rdv=StringField("Titre_du_Rdv",
                        validators=[DataRequired()])

    Adresse2_Rdv=StringField("Titre_du_Rdv",
                        validators=[DataRequired()])

    Code_postal_Rdv=StringField("Code_postal_Rdv",
                        validators=[DataRequired()])
    
    Ville_du_Rdv=StringField("Code_postal_Rdv",
                    validators=[DataRequired()])
    
    Date_Rdv=StringField("Code_postal_Rdv",
                    validators=[DataRequired()])

    Heure_début_Rdv=StringField("Code_postal_Rdv",
                    validators=[DataRequired()])
    
    Heure_fin_Rdv=StringField("Code_postal_Rdv",
                    validators=[DataRequired()])

    Date_Rdv_annulé=StringField("Code_postal_Rdv",
                    validators=[DataRequired()])

    Informations_réservées_service_planification=StringField("Code_postal_Rdv",
                                                 validators=[DataRequired()])

    Informations_générales=StringField("Code_postal_Rdv",
                             validators=[DataRequired()])

    Informations_de_suivi_de_Rdv=StringField("Code_postal_Rdv",
                                    validators=[DataRequired()])

    Chemin_de_fichier_joint = StringField("Code_postal_Rdv",
                                    validators=[DataRequired()])
    
    submit = SubmitField('enregistrer')


class Invitation_Agenda(FlaskForm):

    Expert_invite=StringField("Expert_invite",
                        validators=[DataRequired()])

    submit = SubmitField('enregistrer')


class time(FlaskForm):

    Demarrer=DateField("Demarrer")

    Fin=DateField("Fin")

    submit = SubmitField('enregistrer')