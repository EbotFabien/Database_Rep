from flask import current_app
from Database_Rep.data_base_ import  db,login_manager
from itsdangerous import  TimedJSONWebSignatureSerializer as Serializer
from datetime import datetime
from sqlalchemy import ForeignKeyConstraint,ForeignKey,UniqueConstraint
from flask_login import UserMixin
import json


@login_manager.user_loader
def load_user(user_id):
    return Expert.query.get(int(user_id))

class Client(db.Model):
    __tablename__ = 'Client'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    reference = db.Column(db.String) 	
    TYPE = db.Column(db.String) 
    societe = db.Column(db.String) 	
    sexe = db.Column(db.String) 	
    nom = db.Column(db.String)
    email = db.Column(db.String)
    numero = db.Column(db.String)
    siret=db.Column(db.String)
    date_creation =db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)
  


    #def __init__(self,TYPE,societe,sexe,nom,email,numero,siret):
      #  self.TYPE=TYPE
      #  self.societe= societe
       # self.sexe = sexe
       # self.nom = nom
       # self.email=email
       # self.numero=numero
       # self.siret=siret
     

    def __repr__(self):
        return '<Client %r>' %self.id

class Expert(db.Model,UserMixin):
    __tablename__ = 'Expert'

    id = db.Column(db.Integer,primary_key=True)
    sexe  = db.Column(db.String)	
    nom = db.Column(db.String)
    trigramme=db.Column(db.String)
    TYPE=db.Column(db.String)
    date_entrée=db.Column(db.DateTime,default=datetime.utcnow)
    siret=db.Column(db.String) 
    email = db.Column(db.String)#unique
    numero = db.Column(db.String)
    code_tva=db.Column(db.String)
    taux_tva=db.Column(db.String)
    password = db.Column(db.String(60))
    visibility =db.Column(db.Boolean,default=True)
    
    
 #   def __init__(self,sexe,nom,TYPE,email,numero):
      #  self.sexe =sexe
      #  self.nom =nom
      #  self.TYPE=TYPE
      #  self.email=email
      #  self.numero  =numero

    def get_reset_token(self,expire_sec=1800):
        s = Serializer(current_app.config['SECRET_KEY'],expire_sec)
        return s.dumps({'expert_id':self.id}).decode('utf-8')

    @staticmethod
    def verify_reset_token(token):
        s = Serializer(current_app.config['SECRET_KEY'])
        try:
            expert_id = s.loads(token) ['expert_id']
        except:
            return None
        return Expert.query.get(expert_id)

    def __repr__(self):
        return '<Expert %r>' %self.id
        
class Client_History(db.Model):
    __tablename__ = 'Client_History'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    client_id = db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE"))   	
    adresse  = db.Column(db.String)	
    etat_client=db.Column(db.Boolean,default=True)
    cp 	 = db.Column(db.String)
    ville  = db.Column(db.String)
    pays= db.Column(db.String)
    abonnement=db.Column(db.String)
    date =db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)




        

    def __repr__(self):
        return '<Client_History %r>' %self.id

class Client_negotiateur(db.Model):
    __tablename__ = 'Client_negotiateur'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    client_id = db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE"))   
    client__nego=db.relationship("Client", 
            primaryjoin=(client_id == Client.id),
            backref=db.backref('client__nego',  uselist=False),  uselist=False)
    reference = db.Column(db.String) 	
    TYPE = db.Column(db.String) 
    societe = db.Column(db.String) 	
    sexe = db.Column(db.String) 	
    nom = db.Column(db.String)
    email = db.Column(db.String,unique=True)
    numero = db.Column(db.String)
    siret=db.Column(db.String)
    date_creation =db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)


    def __init__(self,client_id,TYPE,societe,sexe,nom,email,numero,siret):
        self.client_id=client_id
        self.TYPE=TYPE
        self.societe= societe
        self.sexe = sexe
        self.nom = nom
        self.email=email
        self.numero=numero
        self.siret=siret

    def __repr__(self):
        return '<Client_negotiateur %r>' %self.id

class Negotiateur_History(db.Model):
    __tablename__ = 'Negotiateur_History'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    negotiateur_id = db.Column(db.Integer, ForeignKey('Client_negotiateur.id', onupdate="CASCADE", ondelete="CASCADE"))   	
    adresse  = db.Column(db.String)	
    etat_client=db.Column(db.Boolean,default=True)
    cp 	 = db.Column(db.String)
    ville  = db.Column(db.String)
    pays= db.Column(db.String)
    abonnement=db.Column(db.String)
    date =db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)


        

    def __repr__(self):
        return '<Negotiateur_History %r>' %self.id

class suivi_client(db.Model):
    __tablename__ = 'suivi_client'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    client = db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE"))   
    suivi__data=db.relationship("Client", 
        primaryjoin=(client == Client.id),
        backref=db.backref('suivi__data',  uselist=False),  uselist=False)
    responsable=db.Column(db.Integer, db.ForeignKey('Expert.id'))
    responsable__data=db.relationship("Expert", 
        primaryjoin=(responsable == Expert.id),
        backref=db.backref('responsable__data',  uselist=False),  uselist=False)
    #CELL_AS_REFERANT_CLIENT = db.Column(db.Integer, db.ForeignKey('Expert.id'))
    #CELL_PLANIF_REF_SUIVEUR= db.Column(db.Integer, db.ForeignKey('Expert.id'))
    #CELL_DEV_REF_AGENT= db.Column(db.Integer, db.ForeignKey('Expert.id'))
    #CELL_DEV_REF_RESPONSABLE= db.Column(db.Integer, db.ForeignKey('Expert.id'))
    #CELL_PLANIF_REF_AGENT_SAISIE= db.Column(db.Integer, db.ForeignKey('Expert.id'))
    #CELL_PLANIF_REF_RESPONSABLE= db.Column(db.Integer, db.ForeignKey('Expert.id'))
    #CELL_TECH_REF_AGENT= db.Column(db.Integer, db.ForeignKey('Expert.id'))
    #CELL_TECH_REF_RESPONSABLE= db.Column(db.Integer, db.ForeignKey('Expert.id'))
    #CELL_TECH_REF_SUIVEUR= db.Column(db.Integer, db.ForeignKey('Expert.id'))
    #COM_AS_SUR_CA_CLIENT = db.Column(db.String)
    #COM_CELL_DEV_REF_AGENT = db.Column(db.String)
    #COM_CELL_DEV_REF_RESPONSABLE = db.Column(db.String)
    #COM_CELL_PLANIF_REF_AGENT_SAISIE = db.Column(db.String)
    #COM_CELL_PLANIF_REF_RESPONSABLE = db.Column(db.String)
    #COM_CELL_PLANIF_REF_SUIVEUR = db.Column(db.String)
    #COM_CELL_TECH_REF_AGENT = db.Column(db.String)
    #COM_CELL_TECH_REF_RESPONSABLE = db.Column(db.String)
    #COM_CELL_TECH_REF_SUIVEUR = db.Column(db.String)
    #Commercial = db.Column(db.String)
    commentaire = db.Column(db.String)
    date_creation=db.Column(db.DateTime(),default=datetime.utcnow)
    date_modif=db.Column(db.DateTime())
    visibility=visibility =db.Column(db.Boolean,default=True)

    def __init__(self,client,responsable,commentaire):
        self.client=client
        self.responsable=responsable
        self.commentaire= commentaire


    def __repr__(self):
        return '<suivi_client %r>' %self.id

class prospect(db.Model):
    __tablename__ = 'prospect'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    reference = db.Column(db.String) 	
    TYPE = db.Column(db.String) 
    societe = db.Column(db.String) 	
    sexe = db.Column(db.String) 	
    nom = db.Column(db.String)
    email = db.Column(db.String)
    numero = db.Column(db.String)
    siret=db.Column(db.String)
    date_creation =db.Column(db.DateTime,default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)
  


    def __init__(self,TYPE,societe,genre,nom,email,numero):
        self.TYPE=TYPE
        self.societe= societe
        self.genre = genre
        self.nom = nom
        self.email=email
        self.numero=numero
    

    def __repr__(self):
        return '<prospect %r>' %self.id


class prospect_History(db.Model):
    __tablename__ = 'prospect_History'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    prospect = db.Column(db.Integer, ForeignKey('prospect.id', onupdate="CASCADE", ondelete="CASCADE"))   		
    adresse  = db.Column(db.String)	
    cp 	 = db.Column(db.String)
    ville  = db.Column(db.String)
    pays= db.Column(db.String)
    etat_client=db.Column(db.String,default=True)
    date =db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)


    def __repr__(self):
        return '<prospect_History %r>' %self.id

class suivi_prospect(db.Model):
    __tablename__ = 'suivi_prospect'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    prospect_id = db.Column(db.Integer, ForeignKey('prospect.id', onupdate="CASCADE", ondelete="CASCADE"))   
    responsable=db.Column(db.Integer, db.ForeignKey('Expert.id'))
    suivi__data=db.relationship("prospect", 
        primaryjoin=(prospect_id == prospect.id),
        backref=db.backref('prospect__data',  uselist=False),  uselist=False)
    responsable__data=db.relationship("Expert", 
        primaryjoin=(responsable == Expert.id),
        backref=db.backref('responsable___data',  uselist=False),  uselist=False)
    commentaire = db.Column(db.String)
    date_creation=db.Column(db.DateTime(),default=datetime.utcnow)
    date_modif=db.Column(db.DateTime(),default=datetime.utcnow)
    visibility=db.Column(db.Boolean,default=True)

    def __init__(self,prospect,responsable,commentaire):
        self.prospect_id=prospect
        self.responsable=responsable
        self.commentaire= commentaire


    def __repr__(self):
        return '<suivi_prospect %r>' %self.id

class Facturation(db.Model):
    __tablename__ = 'Facturation'

    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    Facture_no  = db.Column(db.Integer)
    Date_    = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    Pays  = db.Column(db.String)
    Destinataire  = db.Column(db.Integer, db.ForeignKey('Client.id'))
    expéditeur  = db.Column(db.Integer, db.ForeignKey('Expert.id'))
    client_data_=db.relationship("Client", 
        primaryjoin=(Destinataire == Client.id),
        backref=db.backref('client_data_',  uselist=False),  uselist=False)

    Montant  = db.Column(db.String)
    TVA  = db.Column(db.String)
    Total  = db.Column(db.String)
    Type  = db.Column(db.String)
    Proprietaire  = db.Column(db.Integer, db.ForeignKey('Client.id'))
    Locataire   =db.Column(db.Integer, db.ForeignKey('Client.id'))
    Ville  = db.Column(db.String)
    Surface  = db.Column(db.String)
    Tarif  = db.Column(db.String)
    Appt_Pav  = db.Column(db.String)
    Visibility =db.Column(db.Boolean,default=True)
    

    def __init__(self,pays,des,exp,mont,total,Type,prop,locat,ville,surface,tarif,appt_pav):
        self.Pays =pays
        self.Destinataire =des
        self.expéditeur =exp
        self.Montant =mont
        self.Total =total
        self.Type =Type
        self.Proprietaire =prop
        self.Locataire =locat
        self.Ville =ville
        self.Surface =surface
        self.Tarif =tarif
        self.Appt_Pav = appt_pav



    def __repr__(self):
        return '<Facturation %r>' %self.id





class Expert_History(db.Model):
    __tablename__ = 'Expert_History'

    id = db.Column(db.Integer,primary_key=True)
    expert_id= db.Column(db.Integer, ForeignKey('Expert.id'))
    actif_parti=db.Column(db.String)
    type_certification=db.Column(db.String)
    date_certification_initiale=db.Column(db.DateTime)
    date_renouv_certification=db.Column(db.DateTime)
    adresse = db.Column(db.String)
    cp=db.Column(db.String)
    login_backof=db.Column(db.String)
    pwd_backof=db.Column(db.String) 
    login_extranet=db.Column(db.String)
    pwd_extranet=db.Column(db.String) 
    pwd_gsuite=db.Column(db.String)
    ville=db.Column(db.String)
    observations_de_suivi=db.Column(db.String)
    date=db.Column(db.DateTime(),default=datetime.utcnow)
    visibility =db.Column(db.Boolean,default=True)


    def __repr__(self):
        return '<Expert_History %r>' %self.id

class Agenda(db.Model):
    __tablename__ = 'Agenda'

    id = db.Column(db.Integer,primary_key=True)
    clien_t  = db.Column(db.Integer, ForeignKey('Client.id'))
    audit_planner  = db.Column(db.Integer, ForeignKey('Expert.id'))
    Agent_referent_du_client  = db.Column(db.Integer, ForeignKey('Expert.id'))

    client__data=db.relationship("Client", 
        primaryjoin=(clien_t == Client.id),
        backref=db.backref('client__data',  uselist=False),  uselist=False)

    Agent_data_=db.relationship("Expert", 
    primaryjoin=(Agent_referent_du_client == Expert.id),
    backref=db.backref('Agent_data_',  uselist=False),  uselist=False)

    audit_planner_data=db.relationship("Expert", 
    primaryjoin=(audit_planner == Expert.id),
    backref=db.backref('audit_planner_data',  uselist=False),  uselist=False)


    Validation_par_agent  = db.Column(db.Boolean,default=False)
    Lieu  = db.Column(db.String)
    Date_  = db.Column(db.DateTime(), nullable=False)
    Rapport  = db.Column(db.String)
    Status  = db.Column(db.Boolean,default=False)
  
    
    def __init__(self,client,audit_planner,agent,lieu,date):
        self.clien_t =client
        self.audit_planner =audit_planner
        self.Agent_referent_du_client = agent
       # self.Validation_par_agent = validation
        self.Lieu =lieu
        self.Date_ =date
       # self.Status = confirmation


    def __repr__(self):
        return '<Agenda %r>' %self.id

    

    
 




class Tarifs(db.Model):
    __tablename__ = 'Tarifs'
    id = db.Column(db.Integer,primary_key=True)
    maison_appartement=db.Column(db.String) 
    type_maison  = db.Column(db.String) 
    Prix_EDL = db.Column(db.String) 
    Prix_Chiffrage =db.Column(db.String) 
    #sur tarifs
    visibility =db.Column(db.Boolean,default=True)

    def __init__(self,maison_appartement, type_maison,Prix):
        self.maison_appartement=maison_appartement
        self.type_maison = type_maison
        self.Prix = Prix

    def __repr__(self):
        return '<Tarifs %r>' %self.id

class Tarifs_client(db.Model):
    __tablename__ = 'Tarifs_client'

    id = db.Column(db.Integer,primary_key=True)
    reference_client= db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE"))   
    maison_appartement=db.Column(db.String) 
    type_maison  = db.Column(db.String) 
    Prix_EDL = db.Column(db.String) 
    Prix_Chiffrage =db.Column(db.String)
    code_tva=db.Column(db.String)
    Cell_AS_referent_client=db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    referent__data=db.relationship("Expert", 
        primaryjoin=(Cell_AS_referent_client == Expert.id),
        backref=db.backref('referent__data',  uselist=False),  uselist=False)

    Cell_AS_referent_client_taux_com  = db.Column(db.String)

    Cell_devel_client =db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    devel__data=db.relationship("Expert", 
        primaryjoin=(Cell_devel_client == Expert.id),
        backref=db.backref('devel__data',  uselist=False),  uselist=False)

    Cell_devel_respon_client_taux_com = db.Column(db.String)

    Cell_devel_agent_suivi_client =db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    agent_suivi__data=db.relationship("Expert", 
        primaryjoin=(Cell_devel_agent_suivi_client == Expert.id),
        backref=db.backref('agent_suivi__data',  uselist=False),  uselist=False)

    Cell_devel_agent_suivi_client_taux_com = db.Column(db.String)

    Cell_tech_Ref_agent_suivi_client =db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    tech_Ref_agent_suivi__data=db.relationship("Expert", 
        primaryjoin=(Cell_tech_Ref_agent_suivi_client == Expert.id),
        backref=db.backref('tech_Ref_agent_suivi__data',  uselist=False),  uselist=False)

    Cell_tech_Ref_respon_suivi_client_taux_com = db.Column(db.String)

    Cell_tech_Ref_suiveur_client =db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    tech_Ref_suiveur__data=db.relationship("Expert", 
        primaryjoin=(Cell_tech_Ref_suiveur_client == Expert.id),
        backref=db.backref('tech_Ref_suiveur__data',  uselist=False),  uselist=False)

    Cell_tech_Ref_suiveur_taux_com  = db.Column(db.String)

    Cell_Planif_Ref_respon_client=db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    Planif_Ref_respon__data=db.relationship("Expert", 
        primaryjoin=(Cell_AS_referent_client == Expert.id),
        backref=db.backref('Cell_Planif_Ref_respon_client',  uselist=False),  uselist=False)
    Cell_Planif_Ref_respon_taux_com = db.Column(db.String)

    Cell_Planif_Ref_suiveur_client =db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    Ref_suiveu__data=db.relationship("Expert", 
        primaryjoin=(Cell_Planif_Ref_suiveur_client == Expert.id),
        backref=db.backref('Ref_suiveu__data',  uselist=False),  uselist=False)

    Cell_Planif_Ref_suiveur_taux_com = db.Column(db.String)

    Cell_Planif_Ref_agent_client =db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    Ref_agent__data=db.relationship("Expert", 
        primaryjoin=(Cell_Planif_Ref_agent_client  == Expert.id),
        backref=db.backref('Ref_agent__data',  uselist=False),  uselist=False)

    Cell_Planif_Ref_agent_taux_com = db.Column(db.String)
    commentaire_libre= db.Column(db.String)
    date=db.Column(db.DateTime(), nullable=False)
    visibility =db.Column(db.Boolean,default=True)
    
    
    def __init__(self,reference_client, type_maison,remise,Prix):
        self.reference_client=reference_client
        self.type_maison = type_maison
        self.remise =remise
        self.Prix = Prix


    def __repr__(self):
        return '<Tarifs_client %r>' %self.id





class Mission(db.Model):
    __tablename__ = 'Mission'

    id = db.Column(db.Integer,primary_key=True)
    Reference_BAILLEUR	 = db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE"))   
    Bailleur__data=db.relationship("Client", 
        primaryjoin=(Reference_BAILLEUR == Client.id),
        backref=db.backref('Bailleur__data',  uselist=False),  uselist=False)
    NRO_FACTURE	 = db.Column(db.String)
    ID_CONCESS	 = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    CONCESS__data=db.relationship("Expert", 
        primaryjoin=(ID_CONCESS == Expert.id),
        backref=db.backref('CONCESS__data',  uselist=False),  uselist=False)
    DATE_REALISE_EDL = db.Column(db.String) 	
    PRIX_HT_EDL	 = db.Column(db.String) 
    TVA_EDL	 = db.Column(db.String) 
    PRIX_TTC_EDL	 = db.Column(db.String) 
    ID_INTERV = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    INTERV__data=db.relationship("Expert", 
        primaryjoin=(ID_INTERV == Expert.id),
        backref=db.backref('INTERV__data',  uselist=False),  uselist=False)	
    Reference_LOCATAIRE	 = db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE"))   
    LOCATAIRE__data=db.relationship("Client", 
        primaryjoin=(Reference_BAILLEUR == Client.id),
        backref=db.backref('LOCATAIRE__data',  uselist=False),  uselist=False)
    CA_HT_AS = db.Column(db.String) 	
    TVA_AS	 = db.Column(db.String) 
    CA_TTC_AS = db.Column(db.String) 	
    CA_HT_AC = db.Column(db.String) 	
    CA_TTC_AC	 = db.Column(db.String) 
    CA_HT_TRUST	 = db.Column(db.String) 
    TVA_TRUST	 = db.Column(db.String) 
    Date_chiffrage_regle = db.Column(db.String) 
    Prix_ht_chiffrage	 = db.Column(db.String) 
    POURCENTAGE_suiveur_chiffrage	 = db.Column(db.String) 
    POURCENTAGE_AS_chiffrage = db.Column(db.String) 	
    POURCENTAGE_manager_chiffrage  = db.Column(db.String) 	
    ID_manager_chiffrage  = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    manager_chiffrage__data=db.relationship("Expert", 
        primaryjoin=(ID_manager_chiffrage == Expert.id),
        backref=db.backref('manager_chiffrage__data',  uselist=False),  uselist=False)	
    POURCENTAGE_agent_chiffrage = db.Column(db.String) 	
    ID_agent_chiffrage  = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 	
    agent_chiffrage__data=db.relationship("Expert", 
        primaryjoin=(ID_agent_chiffrage == Expert.id),
        backref=db.backref('agent_chiffrage__data',  uselist=False),  uselist=False)
    TYPE_EDL = db.Column(db.String) 	
    DATE_FACTURE = db.Column(db.String) 	
    NOMPROPRIO = db.Column(db.String) 	
    DATE_FACT_REGLEE = db.Column(db.String) 	
    DATE_COM_REGLEE_AS = db.Column(db.String) 	
    MONTANT_COM_REGLEE_AS = db.Column(db.String)  	
    DATE_COM_REGLEE_AC = db.Column(db.String) 	
    MONTANT_COM_REGLEE_AC = db.Column(db.String) 	
    TYPE_LOGEMENT = db.Column(db.String) 	
    NBRE_EDL_ABOONEMENT = db.Column(db.String) 	
    MAIL_CONTACT_ENVOI_FACT = db.Column(db.String) 	
    DATE_saisie_enregistrement = db.Column(db.String) 
    CODE_AMEXPERT = db.Column(db.String) 	
    COMMENTAIRE_FACTURE = db.Column(db.String) 	
    TYPE_PAIEMENT = db.Column(db.String) 	
    N_REMISE_DE_CHEQUE = db.Column(db.String) 	
    SAISIE_TRAITE_PAR = db.Column(db.String) 	
    infos_et_TRAITEMENT = db.Column(db.String) 	
    LOGEMENT_MEUBLE = db.Column(db.String) 	
    CODE_FACTURATION = db.Column(db.String) 	
    TYPE_DE_BIEN = db.Column(db.String) 	
    surface_logement1 = db.Column(db.String) 	
    ETAGE = db.Column(db.String) 	
    POINTAGE = db.Column(db.String) 	
    DATE_POINTAGE = db.Column(db.String) 	
    DEVEL = db.Column(db.String) 	
    DATE_EXTRACTION_COMPTABLE = db.Column(db.String) 	
    POURCENTAGE_COM_AS_DU_CLIENT = db.Column(db.String) 	
    ID_Respon_Cell_Dev	 = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    Respon_Cell_Dev__data=db.relationship("Expert", 
        primaryjoin=(ID_Respon_Cell_Dev == Expert.id),
        backref=db.backref('Respon_Cell_Dev__data',  uselist=False),  uselist=False)
    POURCENTAGE_Respon_Cell_Dev = db.Column(db.String) 	
    ID_agent_Cell_Dev = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 	
    agent_Cell_Dev__data=db.relationship("Expert", 
        primaryjoin=(ID_agent_Cell_Dev == Expert.id),
        backref=db.backref('agent_Cell_Dev__data',  uselist=False),  uselist=False)
    POURCENTAGE_Agent_Cell_Dev = db.Column(db.String) 	
    ID_Agent_CellTech = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"))  	
    Agent_CellTech__data=db.relationship("Expert", 
        primaryjoin=(ID_Agent_CellTech == Expert.id),
        backref=db.backref('Agent_CellTech__data',  uselist=False),  uselist=False)
    POURCENTAGE_Agent_Cell_Tech = db.Column(db.String) 	
    ID_Respon_Cell_Tech = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) #######
    Respon_Cell_Tech__data=db.relationship("Expert", 
        primaryjoin=(ID_Respon_Cell_Tech == Expert.id),
        backref=db.backref('Respon_Cell_Tech__data',  uselist=False),  uselist=False)	
    POURCENTAGE_Respon_Cell_Tech = db.Column(db.String) 	
    ID_Suiveur_Cell_Tech  = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    Suiveur_Cell_Tech__data=db.relationship("Expert", 
        primaryjoin=(ID_Suiveur_Cell_Tech == Expert.id),
        backref=db.backref('Suiveur_Cell_Tech__data',  uselist=False),  uselist=False)
    POURCENTAGE_Suiveur_Cell_Tech	 = db.Column(db.String) 
    ID_Respon_Cell_Planif = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    Respon_Cell_Planif__data=db.relationship("Expert", 
        primaryjoin=(ID_Respon_Cell_Planif == Expert.id),
        backref=db.backref('Respon_Cell_Planif__data',  uselist=False),  uselist=False)
    POURCENTAGE_Respon_Cell_Planif  = db.Column(db.String) 	
    ID_Suiveur_Cell_Planif  = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    Suiveur_Cell_Planif__data=db.relationship("Expert", 
        primaryjoin=(ID_Suiveur_Cell_Planif == Expert.id),
        backref=db.backref('Suiveur_Cell_Planif__data',  uselist=False),  uselist=False)
    POURCENTAGE_Suiveur_Cell_Planif	 = db.Column(db.String) 
    ID_Agent_saisie_Cell_Planif  = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE"))
    Agent_saisie_Cell_Planif__data=db.relationship("Expert", 
        primaryjoin=(ID_Agent_saisie_Cell_Planif == Expert.id),
        backref=db.backref('Agent_saisie_Cell_Planif__data',  uselist=False),  uselist=False)  	
    POURCENTAGE_Agent_saisie_CEll_planif  = db.Column(db.String) 
    Visibility =db.Column(db.Boolean,default=True)
    

    
    def __init__(self,Reference_BAILLEUR,NRO_FACTURE,ID_CONCESS,DATE_REALISE_EDL,PRIX_HT_EDL,TVA_EDL,PRIX_TTC_EDL,ID_INTERV,Reference_LOCATAIRE,CA_HT_AS,TVA_AS,CA_TTC_AS,CA_HT_AC,CA_TTC_AC,CA_HT_TRUST,TVA_TRUST,Date_chiffrage_regle,Prix_ht_chiffrage,POURCENTAGE_suiveur_chiffrage,POURCENTAGE_AS_chiffrage,
    POURCENTAGE_manager_chiffrage,ID_manager_chiffrage,POURCENTAGE_agent_chiffrage,ID_agent_chiffrage,TYPE_EDL,DATE_FACTURE,NOMPROPRIO,DATE_FACT_REGLEE,DATE_COM_REGLEE_AS,
    MONTANT_COM_REGLEE_AS,DATE_COM_REGLEE_AC,MONTANT_COM_REGLEE_AC,TYPE_LOGEMENT,NBRE_EDL_ABOONEMENT,MAIL_CONTACT_ENVOI_FACT,DATE_saisie_enregistrement,CODE_AMEXPERT,COMMENTAIRE_FACTURE,TYPE_PAIEMENT,
    N_REMISE_DE_CHEQUE,SAISIE_TRAITE_PAR,infos_TRAITEMENT,LOGEMENT_MEUBLE,CODE_FACTURATION,TYPE_DE_BIEN,surface_logement,ETAGE,POINTAGE,DATE_POINTAGE,DEVEL,DATE_EXTRACTION_COMPTABLE,
    POURCENTAGE_COM_AS_DU_CLIENT,ID_Respon_Cell_Dev,POURCENTAGE_Respon_Cell_Dev,ID_agent_Cell_Dev,POURCENTAGE_Agent_Cell_Dev,ID_Agent_CellTech,POURCENTAGE_Agent_Cell_Tech,
    ID_Respon_Cell_Tech,POURCENTAGE_Respon_Cell_Tech,ID_Suiveur_Cell_Tech,POURCENTAGE_Suiveur_Cell_Tech,ID_Respon_Cell_Planif ,POURCENTAGE_Respon_Cell_Planif,ID_Suiveur_Cell_Planif,	
    POURCENTAGE_Suiveur_Cell_Planif,ID_Agent_saisie_Cell_Planif,POURCENTAGE_Agent_saisie_CEll_planif):
        self.Reference_BAILLEUR =Reference_BAILLEUR
        self.NRO_FACTURE=NRO_FACTURE
        self.ID_CONCESS =ID_CONCESS
        self.DATE_REALISE_EDL =DATE_REALISE_EDL
        self.PRIX_HT_EDL = PRIX_HT_EDL
        self.TVA_EDL =TVA_EDL
        self.PRIX_TTC_EDL=PRIX_TTC_EDL
        self.ID_INTERV=ID_INTERV 
        self.Reference_LOCATAIRE = Reference_LOCATAIRE
        self.CA_HT_AS = CA_HT_AS
        self.TVA_AS = TVA_AS
        self.CA_TTC_AS = CA_TTC_AS
        self.CA_HT_AC = CA_HT_AC
        self.CA_TTC_AC = CA_TTC_AC
        self.CA_HT_TRUST =CA_HT_TRUST
        self.TVA_TRUST = TVA_TRUST
        self.Date_chiffrage_regle = Date_chiffrage_regle
        self.Prix_ht_chiffrage = Prix_ht_chiffrage
        self.POURCENTAGE_suiveur_chiffrage = POURCENTAGE_suiveur_chiffrage
        self.POURCENTAGE_AS_chiffrage = POURCENTAGE_AS_chiffrage
        self.POURCENTAGE_manager_chiffrage = POURCENTAGE_manager_chiffrage
        self.ID_manager_chiffrage = ID_manager_chiffrage
        self.POURCENTAGE_agent_chiffrage = POURCENTAGE_agent_chiffrage
        self.ID_agent_chiffrage = ID_agent_chiffrage
        self.TYPE_EDL = TYPE_EDL
        self.DATE_FACTURE = DATE_FACTURE
        self.NOMPROPRIO = NOMPROPRIO
        self.DATE_FACT_REGLEE = DATE_FACT_REGLEE
        self.DATE_COM_REGLEE_AS = DATE_COM_REGLEE_AS
        self.MONTANT_COM_REGLEE_AS = MONTANT_COM_REGLEE_AS
        self.DATE_COM_REGLEE_AC = DATE_COM_REGLEE_AC
        self.MONTANT_COM_REGLEE_AC =MONTANT_COM_REGLEE_AC
        self.TYPE_LOGEMENT = TYPE_LOGEMENT
        self.NBRE_EDL_ABOONEMENT = NBRE_EDL_ABOONEMENT
        self.MAIL_CONTACT_ENVOI_FACT = MAIL_CONTACT_ENVOI_FACT
        self.DATE_saisie_enregistrement =DATE_saisie_enregistrement
        self.CODE_AMEXPERT = CODE_AMEXPERT
        self.COMMENTAIRE_FACTURE = COMMENTAIRE_FACTURE
        self.TYPE_PAIEMENT = TYPE_PAIEMENT
        self.N_REMISE_DE_CHEQUE = N_REMISE_DE_CHEQUE
        self.SAISIE_TRAITE_PAR = SAISIE_TRAITE_PAR
        self.infos_TRAITEMENT = infos_TRAITEMENT
        self.LOGEMENT_MEUBLE = LOGEMENT_MEUBLE
        self.CODE_FACTURATION = CODE_FACTURATION
        self.TYPE_DE_BIEN = TYPE_DE_BIEN
        self.surface_logement = surface_logement
        self.ETAGE = ETAGE
        self.POINTAGE = POINTAGE
        self.DATE_POINTAGE = DATE_POINTAGE
        self.DEVEL = DEVEL
        self.DATE_EXTRACTION_COMPTABLE = DATE_EXTRACTION_COMPTABLE
        self.POURCENTAGE_COM_AS_DU_CLIENT = POURCENTAGE_COM_AS_DU_CLIENT
        self.ID_Respon_Cell_Dev = ID_Respon_Cell_Dev
        self.POURCENTAGE_Respon_Cell_Dev = POURCENTAGE_Respon_Cell_Dev
        self.ID_agent_Cell_Dev = ID_agent_Cell_Dev
        self.POURCENTAGE_Agent_Cell_Dev = POURCENTAGE_Agent_Cell_Dev
        self.ID_Agent_CellTech = ID_Agent_CellTech
        self.POURCENTAGE_Agent_Cell_Tech = POURCENTAGE_Agent_Cell_Tech
        self.ID_Respon_Cell_Tech = ID_Respon_Cell_Tech
        self.POURCENTAGE_Respon_Cell_Tech = POURCENTAGE_Respon_Cell_Tech
        self.ID_Suiveur_Cell_Tech = ID_Suiveur_Cell_Tech
        self.POURCENTAGE_Suiveur_Cell_Tech = POURCENTAGE_Suiveur_Cell_Tech
        self.ID_Respon_Cell_Planif  = ID_Respon_Cell_Planif 
        self.POURCENTAGE_Respon_Cell_Planif = POURCENTAGE_Respon_Cell_Planif
        self.ID_Suiveur_Cell_Planif = ID_Suiveur_Cell_Planif
        self.POURCENTAGE_Suiveur_Cell_Planif = POURCENTAGE_Suiveur_Cell_Planif
        self.ID_Agent_saisie_Cell_Planif = ID_Agent_saisie_Cell_Planif
        self.POURCENTAGE_Agent_saisie_CEll_planif = POURCENTAGE_Agent_saisie_CEll_planif


    def __repr__(self):
        return '<Mission %r>' %self.id