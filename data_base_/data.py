from Database_project.project.data_base_ import db
from Database_project.project.data_base_.Models import Tarifs,Mission,Client,Expert,Client_History,prospect,prospect_History,Expert_History,Tarif_base
import xlrd
import openpyxl

def insert_client(A,loc):
    

    wb = xlrd.open_workbook(loc)
    sheet = wb.sheet_by_index(0)
    
    sheet.cell_value(0, 0)
    for i in range(0,5):
        name=sheet.row_values(i+1)
        
        if A == 'professionelle':
            
            if name[3] == '' or name[3] == 'XX':
                print('no data here')
            else:
                cli=Client.query.filter_by(nom=str(name[3].lower())).first()#arrange sort by reference
                if cli is None:
                    client=Client(TYPE=A,societe=name[1].lower(),sexe=name[2].lower(),nom=name[3].lower(),email='test@gmail.com',numero='6777650822',siret='22222222222')
                    db.session.add(client)
                    db.session.commit()   
                    client.reference=int(name[0])
                    db.session.commit()
                    history=Client_History(client_id=client.id,adresse=name[4],cp=name[6],ville=name[7],pays='')
                    db.session.add(history)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'particulier':
            if name[43] == '' or name[43] == 'XX':
                print('no data here')
            else:
                cli=Client.query.filter_by(NOM=str(name[43].lower())).first()
                if cli is None:
                    cli2=Client('',A,'',name[42].lower(),name[43].lower(),'','','','','','','','','')
                    db.session.add(cli2)
                    db.session.commit()
                else:
                    print('already exist')

        
#to be fixed

def expert__(A,loc):

    wb = xlrd.open_workbook(loc)
    sheet = wb.sheet_by_index(0)

    sheet.cell_value(0, 0)
    for i in range(0,400):
        name=sheet.row_values(i+1)
        if A == 'Interv':
            if name[17] == '' or name[17] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(nom=str(name[17].lower())).first()
                if cli is None:
                    expert=Expert(sexe=name[16],nom=name[17],numero='222000000',TYPE=A, email='test@gmail.com')    
                    db.session.add(expert)
                    db.session.commit()
                    history=Expert_History(expert_id=expert.id)
                    db.session.add(history)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'CONCESS':
            if name[11] == '' or name[11] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(nom=str(name[11].lower())).first()
                if cli is None:
                    expert=Expert(sexe=name[10],nom=name[11],numero='222000000',TYPE=A, email='test@gmail.com')      
                    db.session.add(expert)
                    db.session.commit()
                    history=Expert_History(expert_id=expert.id)
                    db.session.add(history)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Manager_chiffrage':
            if name[37] == '' or name[37] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[37].lower())).first()
                if cli is None:
                    expert=Expert('',name[37].lower(),A,'','')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')
        
        if A == 'Agent_chiffrage':
            if name[39] == '' or name[39] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[39].lower())).first()
                if cli is None:
                    expert=Expert('',name[39].lower(),A,'','')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Respon Cell Dev':
            if name[69] == '' or name[69] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[69].lower()).lower()).first()
                if cli is None:
                    expert=Expert('',name[69].lower(),A,'','')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        

        if A == 'agent Cell Dev':
            if name[71] == '' or name[71] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[71].lower())).first()
                if cli is None:
                    expert=Expert('',name[71].lower(),A,'','')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Agent CellTech':
            if name[73] == '' or name[73] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[73].lower())).first()
                if cli is None:
                    expert=Expert('',name[73].lower(),A,'','')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Respon Cell Tech':
            if name[75] == '' or name[75] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[75].lower())).first()
                if cli is None:
                    expert=Expert('',name[75].lower(),A,'','')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Suiveur Cell Tech':
            if name[77] == '' or name[77] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[77].lower())).first()
                if cli is None:
                    expert=Expert('',name[77].lower(),A,'','')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Respon Cell Planif':
            if name[79] == '' or name[79] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[79].lower())).first()
                if cli is None:
                    expert=Expert('',name[79].lower(),A,'','')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Suiveur Cell Planif':
            if name[81] == '' or name[81] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[81].lower())).first()
                if cli is None:
                    expert=Expert('',name[81].lower(),A,'','')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Agent saisie Cell Planif':
            if name[83] == '' or name[83] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[83].lower())).first()
                if cli is None:
                    expert=Expert('',name[83].lower(),A,'','')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')
        

def tarif_client(loc):
    wb = xlrd.open_workbook(loc)
    sheet = wb.sheet_by_index(0)

    sheet.cell_value(0, 0)
    for i in range(0,4):
        name=sheet.row_values(i+1)
        tarif =Tarifs.query.filter_by(reference_client=int(name[1])).first()
        cli=Client.query.filter_by(reference=int(name[1])).first()
        if tarif is None:
            if cli :
                taf_base =Tarifs(reference_client=cli.id,code_tva=int(name[2]),
                referent_as_client=int(name[3]),com_as_sur_ca_client=name[4],cell_dev_ref_responsable=name[5],
                com_cell_dev_ref_responsable=name[6],Cell_dev_ref_agent=int(name[7]),com_cell_dev_ref_agent=name[8],
                Cell_tech_Ref_agent=int(name[9]),com_cell_tech_Ref_agent=name[10],CELL_TECH_ref_responsable=int(name[11]),
                COM_CELL_TECH_ref_responsable=name[12],CELL_TECH_ref_suiveur=int(name[13]),
                com_CELL_TECH_ref_suiveur=name[14],CELL_planif_ref_responsable=int(name[15]),
                com_CELL_planif_ref_responsable=name[16],CELL_PLANIF_ref_suiveur=int(name[17]),
                com_CELL_PLANIF_ref_suiveur=name[18],CELL_PLANIF_ref_agent_saisie=int(name[19]),
                com_CELL_PLANIF_ref_agent_saisie=name[20],taux_meuble=name[21],EDL_PRIX_STD=int(name[22]),
                EDL_APPT_prix_F1=int(name[23]),EDL_APPT_prix_F2=int(name[24]),EDL_APPT_prix_F3=int(name[25]),EDL_APPT_prix_F4=int(name[26]),
                EDL_APPT_prix_F5=int(name[27]),EDL_APPT_prix_F6=int(name[28]),EDL_PAV_villa_prix_T1=int(name[29]), EDL_PAV_villa_prix_T2=int(name[30]),
                EDL_PAV_villa_prix_T3=int(name[31]),EDL_PAV_villa_prix_T4=int(name[32]),EDL_PAV_villa_prix_T5=int(name[33]),EDL_PAV_villa_prix_T6=int(name[34]),
                EDL_PAV_villa_prix_T7=int(name[35]),EDL_PAV_villa_prix_T8=int(name[36]),CHIF_APPT_prix_stu=int(name[37]),
                CHIF_APPT_prix_F1=int(name[38]),CHIF_APPT_prix_F2=int(name[39]),CHIF_APPT_prix_F3=int(name[40]),
                CHIF_APPT_prix_F4=int(name[41]),CHIF_APPT_prix_F5=int(name[42]),CHIF_PAV_villa_prix_T1=int(name[43]),
                CHIF_PAV_villa_prix_T2=int(name[44]),CHIF_PAV_villa_prix_T3=int(name[45]),CHIF_PAV_villa_prix_T4=int(name[46]),
                CHIF_PAV_villa_prix_T5=int(name[47]),CHIF_PAV_villa_prix_T6=int(name[48]),CHIF_PAV_villa_prix_T7=int(name[49]),
                CHIF_PAV_villa_prix_T8=int(name[50]))
                
                db.session.add(taf_base)
                db.session.commit()
            else:
                print('esit2')
        else:
            print('esit')

def Missions(loc):

    wb_obj = openpyxl.load_workbook(loc)
    sheet=wb_obj.active
    
    for i in range(1,110):
        
        cli=Client.query.filter_by(reference=int(sheet["B"][i].value)).first()
        if cli:
            mission=Mission(cli.id,0,int(sheet["E"][i].value),sheet["G"][i].value,0,
                    0,0,0,0,0,0,
                    0,0,0,0,0,0,0,
                    0,0,0,0,0,0,
                    0,0,0,0,0,0,
                    0,0,0,0,0,0,
                    0,0,0,0,0,0,
                    0,0,
                    0,0,0,0,0,0,
                    0,0,0,0,0,0,
                    0,0,0,0,0,0,
                    0,0,0,
                    0,0,0)

            db.session.add(mission)
            db.session.commit()
    mission_=list(Mission.query.all())
    for a in range(0,110):
        mission_[a].TYPE_LOGEMENT =sheet["AH"][i].value
        mission_[a].DATE_FACTURE = sheet["AP"][i].value
        mission_[a].CODE_FACTURATION = sheet["AL"][i].value
        db.session.commit()
        

def mission_date(loc):
    wb_obj = openpyxl.load_workbook(loc)
    sheet=wb_obj.active
    mission_=list(Mission.query.all())
    for i in range(1,40):
        for a in range(0,40):
            mission_[a].DATE_REALISE_EDL =sheet["M"][i].value
            mission_[a].Date_chiffrage_regle =sheet["AG"][i].value
            mission_[a].DATE_FACTURE = sheet["AP"][i].value
            mission_[a].DATE_FACT_REGLEE = sheet["AS"][i].value
            db.session.commit()

































#Missions()






#insert_client('Bailleur')
#insert_client('Locataire')
#insert_client('Prop')
#expert_('Interv')
#expert_('CONCESS')
#expert_('Manager_chiffrage')
#expert_('Agent_chiffrage')
#expert_('Respon Cell Dev')
#expert_('agent Cell Dev')
#expert_('Agent CellTech')
#expert_('Respon Cell Tech')
#expert_('Suiveur Cell Tech')
#expert_('Respon Cell Planif')
#expert_('Suiveur Cell Planif')
#expert_('Agent saisie Cell Planif')
