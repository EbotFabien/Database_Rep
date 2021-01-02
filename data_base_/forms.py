from flask_wtf import FlaskForm,RecaptchaField, Recaptcha
from flask_wtf.file import FileField, FileAllowed
from flask_login import current_user
from wtforms import StringField,PasswordField,SubmitField,BooleanField,SelectField, IntegerField
from wtforms.validators import DataRequired,length,Email,EqualTo,ValidationError
from data_base_.Models import Expert ,Client




class RegistrationForm(FlaskForm):
    username =StringField("Nom d'utilisateur",
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

    Titre=SelectField('Titre',
                             choices=[('MME', 'MME'), ('M.', 'M.')])

    submit = SubmitField('enregistrer')

    modifier = SubmitField('modifier')
    
    def validate_username(self,username):
        user = Expert.query.filter_by(NOM=username.data).first()

        if user:
            raise ValidationError("Ce nom d'utilisateur est pris. Veuillez choisir un autre nom")

    def validate_email(self,email):
        email = Expert.query.filter_by(EMAIL=email.data).first()

        if email:
            raise ValidationError('Cet e-mail est déjà utilisé par un autre utilisateur')

class LoginForm(FlaskForm):
    username =StringField("Nom d'utilisateur",
                                     validators=[DataRequired(),length(min=4 ,max=20, message='Le champ est obligatoire')])

    password =PasswordField('Mot de passe',
                                  validators=[DataRequired(),length(min=4 ,max=20, message="Le champ doit comporter entre 4 et 20 caractères.")])

    recaptcha = RecaptchaField(validators=[Recaptcha(message="Le reCAPTCHA n'a pas été saisi correctement. Revenez en arrière et essayez à nouveau.")])
    remember = BooleanField('Remember me')                              
    submit = SubmitField('Se connecter')
    
class tableform(FlaskForm):
        table =StringField('table',validators=[DataRequired()])

        submit = SubmitField('Recherchez')

class Chiffrage_Form(FlaskForm):
    Mission =StringField(" Mission",
                                validators=[DataRequired()])
    
    Type_expert =SelectField('Type_Expert',
                             choices=[('Interv', 'Interv'), ('CONCESS', 'CONCESS'), ('agent Cell Dev', 'agent Cell Dev'),('Interv', 'Interv'),('Suiveur Cell Tech', 'Suiveur Cell Tech'),('Suiveur Cell Planif', 'Suiveur Cell Planif'),('Admin', 'Admin'),('Audit', 'Audit')])


    Pourcentage_gain =StringField('Pourcentage_gain',
                           validators=[DataRequired()])

    submit = SubmitField('enregistrer')

class Tarif_Form(FlaskForm):
  service = StringField('Nom du service offert', validators=[DataRequired()])
  type_de_tarif = SelectField('Type', choices=[('basic', 'basic'), ('premium', 'premium')])
  prix = StringField('Prix', validators=[DataRequired()])

  submit = SubmitField('enregistrer')

  modifier = SubmitField('modifier')

class Facturation_Form(FlaskForm):
    
    Date =StringField('Date',
                                validators=[DataRequired()])

    Pays =StringField('Pays',
                           validators=[DataRequired()])

    ID_Destinataire =StringField('ID_Destinataire',
                           validators=[DataRequired()])    

    ID_expediteur =StringField('ID_expediteur',
                           validators=[DataRequired()])

    montant=StringField('montant',
                           validators=[DataRequired()])

    TVA=StringField('Pourcentage_gain',
                           validators=[DataRequired()])
    
    total=StringField('total',
                           validators=[DataRequired()])
    
    Type_=SelectField('Type_',
                             choices=[('Entrant', 'Entrant'), ('Sortant', 'Sortant')])

    ID_proprietaire=StringField('proprietaire',
                           validators=[DataRequired()])

    ID_locataire=StringField('locataire',
                           validators=[DataRequired()])
    
    ville=StringField('ville',
                           validators=[DataRequired()])

    surface=StringField('surface',
                           validators=[DataRequired()])

    tarifs=StringField('tarifs',
                           validators=[DataRequired()])
    
    appt_pav=StringField('appt_pav',
                           validators=[DataRequired()])


    submit = SubmitField('enregistrer')


class Client_Form(FlaskForm):
    
    Type=SelectField('Type',
                             choices=[('BAILLEUR', 'Bailleur'), ('LOCATAIRE', 'Locataire')])

    Societe =StringField('Societe',
                           validators=[DataRequired()])

    Titre=SelectField('Sexe',
                             choices=[('femelle', 'femelle'), ('male', 'male')])

    NOM =StringField('Noms',
                           validators=[DataRequired()])
    
    email =StringField('E-mail',
                           validators=[DataRequired(),Email()])

    Numero =StringField('Tel',
                           validators=[DataRequired()])

    Adresse1=StringField('Adresse 1',
                           validators=[DataRequired()])

    Adresse2=StringField('Adresse 2',
                           validators=[DataRequired()])

    CP=StringField('Code Postal',
                           validators=[DataRequired()])
    
    Ville=StringField('Ville',
                           validators=[DataRequired()])
    
    Numero_de_compte=StringField("Numero de compte ",
                           validators=[DataRequired()])

    Pays=SelectField("Pays ", choices=[('France', 'France'), ('Belgique', 'Belgique')],
                        validators=[DataRequired()])

    submit = SubmitField('enregistrer')

    modifier = SubmitField('modifier')



    def validate_username(self,username):
        user = Client.query.filter_by(NOM=username.data).first()

        if user:
            raise ValidationError("Ce nom d'utilisateur est pris. Veuillez choisir un autre nom")

    def validate_email(self,email):
        email = Client.query.filter_by(EMAIL=email.data).first()

        if email:
            raise ValidationError('Cet e-mail est déjà utilisé par un autre utilisateur')