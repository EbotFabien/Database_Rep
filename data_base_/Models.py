from data_base_ import  db,login_manager
from sqlalchemy import ForeignKeyConstraint,ForeignKey,UniqueConstraint
from flask_login import UserMixin
import json


@login_manager.user_loader
def load_user(user_id):
    return Expert.query.get(int(user_id))

class Client(db.Model):
    __tablename__ = 'Client'

    id = db.Column(db.Integer)
    Reference = db.Column(db.Integer,primary_key=True,autoincrement=True) 	
    TYPE = db.Column(db.String) 
    SOCIETE = db.Column(db.String) 	
    TITRE = db.Column(db.String) 	
    NOM = db.Column(db.String)
    EMAIL = db.Column(db.String)
    NUMERO = db.Column(db.String)
    ADRESSE1 = db.Column(db.String) 	
    ADRESSE2  = db.Column(db.String)	
    CP 	 = db.Column(db.String)
    VILLE  = db.Column(db.String)
    Pays= db.Column(db.String)
    abonnement=db.Column(db.String)
    Numero_de_compte  = db.Column(db.String) #unique
    Visibility =db.Column(db.Boolean,default=True)
  


    def __init__(self,TYPE,societe,titre,nom,email,numero,adresse1,adresse2,cp,ville,pays,Numero_de_compte):
        self.TYPE=TYPE
        self.SOCIETE= societe
        self.TITRE = titre
        self.NOM = nom
        self.EMAIL=email
        self.NUMERO=numero
        self.ADRESSE1 =adresse1
        self.ADRESSE2 =adresse2
        self.CP = cp
        self.VILLE = ville
        self.Pays = pays 
        self.Numero_de_compte = Numero_de_compte      

    def __repr__(self):
        return '<Client %r>' %self.id


class Facturation(db.Model):
    __tablename__ = 'Facturation'

    id = db.Column(db.Integer)
    Facture_no  = db.Column(db.Integer,primary_key=True,autoincrement=True)
    Date_    = db.Column(db.DateTime(), nullable=False)
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
    

    def __init__(self,pays,des,exp,mont,tva,total,Type,prop,locat,ville,surface,tarif,appt_pav):
        self.Pays =pays
        self.Destinataire =des
        #self.Numero_de_compte = compte
        self.expéditeur =exp
        self.Montant =mont
        self.TVA = tva
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


class Expert(db.Model,UserMixin):
    __tablename__ = 'Expert'

    id = db.Column(db.Integer,primary_key=True)
    TITRE  = db.Column(db.String)	
    NOM = db.Column(db.String)
    TYPE = db.Column(db.String)
    EMAIL = db.Column(db.String)
    NUMERO = db.Column(db.Integer)
    password = db.Column(db.String(60))
    Visibility =db.Column(db.Boolean,default=True)
    
    
    def __init__(self,titre,nom,Type,email,numero):
        self.TITRE =titre
        self.NOM =nom
        self.TYPE=Type
        self.EMAIL=email
        self.NUMERO =numero


    def __repr__(self):
        return '<Expert %r>' %self.id


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

    

    
 

class Chiffrage(db.Model):
    __tablename__ = 'Chiffrage'

    id = db.Column(db.Integer,primary_key=True)
    Mission  = db.Column(db.String) 
    Type_expert  = db.Column(db.String)
    Pourcentage_gain  = db.Column(db.String) 
    visibility =db.Column(db.Boolean,default=True)
    
    
    def __init__(self,mission,type_expert,pourcentage_gain):
        self.Mission =mission
        self.Type_expert=type_expert
        self.Pourcentage_gain=pourcentage_gain


    def __repr__(self):
        return '<Chiffrage %r>' %self.id


class Tarifs(db.Model):
    __tablename__ = 'Tarifs'

    id = db.Column(db.Integer,primary_key=True)
    reference_client= db.Column(db.Integer, ForeignKey('Client.id', onupdate="CASCADE", ondelete="CASCADE"))   
    type_maison  = db.Column(db.String) 
    Prix  = db.Column(db.String) 
    remise  = db.Column(db.String)
    visibility =db.Column(db.Boolean,default=True)
    
    
    def __init__(self,reference_client, type_maison,remise,Prix):
        self.reference_client=reference_client
        self.type_maison = type_maison
        self.remise =remise
        self.Prix = Prix


    def __repr__(self):
        return '<Tarifs %r>' %self.id



class Mission(db.Model):
    __tablename__ = 'Mission'

    id = db.Column(db.Integer,primary_key=True)
    Reference_BAILLEUR	 = db.Column(db.Integer, ForeignKey('Client.Reference', onupdate="CASCADE", ondelete="CASCADE"))   
    Bailleur__data=db.relationship("Client", 
        primaryjoin=(Reference_BAILLEUR == Client.id),
        backref=db.backref('Bailleur__data',  uselist=False),  uselist=False)
    NRO_FACTURE	 = db.Column(db.String)
    ABONNEMENT	 = db.Column(db.String)  
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
    Reference_LOCATAIRE	 = db.Column(db.Integer, ForeignKey('Client.Reference', onupdate="CASCADE", ondelete="CASCADE"))   
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
    Nom_Respon_Cell_Tech = db.Column(db.String) #######	
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
    Nom_Suiveur_Cell_Planif  = db.Column(db.Integer, ForeignKey('Expert.id', onupdate="CASCADE", ondelete="CASCADE")) 
    Suiveur_Cell_Planif__data=db.relationship("Expert", 
        primaryjoin=(ID_Respon_Cell_Planif == Expert.id),
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
    Nom_Respon_Cell_Tech,POURCENTAGE_Respon_Cell_Tech,ID_Suiveur_Cell_Tech,POURCENTAGE_Suiveur_Cell_Tech,ID_Respon_Cell_Planif ,POURCENTAGE_Respon_Cell_Planif,Nom_Suiveur_Cell_Planif,	
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
        self.Nom_Respon_Cell_Tech = Nom_Respon_Cell_Tech
        self.POURCENTAGE_Respon_Cell_Tech = POURCENTAGE_Respon_Cell_Tech
        self.ID_Suiveur_Cell_Tech = ID_Suiveur_Cell_Tech
        self.POURCENTAGE_Suiveur_Cell_Tech = POURCENTAGE_Suiveur_Cell_Tech
        self.ID_Respon_Cell_Planif  = ID_Respon_Cell_Planif 
        self.POURCENTAGE_Respon_Cell_Planif = POURCENTAGE_Respon_Cell_Planif
        self.Nom_Suiveur_Cell_Planif = Nom_Suiveur_Cell_Planif
        self.POURCENTAGE_Suiveur_Cell_Planif = POURCENTAGE_Suiveur_Cell_Planif
        self.ID_Agent_saisie_Cell_Planif = ID_Agent_saisie_Cell_Planif
        self.POURCENTAGE_Agent_saisie_CEll_planif = POURCENTAGE_Agent_saisie_CEll_planif


    def __repr__(self):
        return '<Mission %r>' %self.id