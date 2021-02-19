from Database_project.project.data_base_ import db
from Database_project.project.data_base_.Models import Tarifs,Mission,Client,Expert
import xlrd
import openpyxl

def insert_client(A,loc):
    
    wb = xlrd.open_workbook(loc)
    sheet = wb.sheet_by_index(0)
    
    sheet.cell_value(0, 0)
    for i in range(0,50):
        name=sheet.row_values(i+1)
        
        if A == 'Bailleur':
            
            if name[3] == '' or name[3] == 'XX':
                print('no data here')
            else:
                cli=Client.query.filter_by(NOM=str(name[3].lower())).first()#arrange sort by reference
                if cli is None:
                    client=Client(str(name[0]),'BAILLEUR',name[1].lower(),name[2].lower(),name[3].lower(),'','',name[4].lower(),name[5].lower(),name[6],name[7].lower(),'',name[9],'')
                    db.session.add(client)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Prop':
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

        if A == 'Locataire':
            if name[20] == '' or name[20] == 'XX':
                print('no data here')
            else:
                cli1=Client.query.filter_by(Reference=str(name[18])).first()    
                if cli1 is None:
                    client=Client(str(name[18]),A,'',name[19].lower(),name[20].lower(),'','',name[21].lower(),name[22],name[23],name[24],'','','')
                    db.session.add(client)
                    db.session.commit()

                else:
                    print('already exist')


def expert__(A,loc):

    wb = xlrd.open_workbook(loc)
    sheet = wb.sheet_by_index(0)

    sheet.cell_value(0, 0)
    for i in range(0,50):
        name=sheet.row_values(i+1)
        if A == 'Interv':
            if name[17] == '' or name[17] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[17].lower())).first()
                if cli is None:
                    expert=Expert(name[16],name[17].lower(),A,'','')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'CONCESS':
            if name[11] == '' or name[11] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[11].lower())).first()
                if cli is None:
                    expert=Expert(name[10],name[11].lower(),A,'','')
                    db.session.add(expert)
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
        


def Missions(loc):

    wb = xlrd.open_workbook(loc)
    sheet = wb.sheet_by_index(0)

    sheet.cell_value(0, 0)
    for i in range(0,50):
        name=sheet.row_values(i+1)
        
        client1=Client.query.filter_by(NOM=str(name[3].lower())).first()
        if client1 is not None:
            name[3]=client1.id
        if name[3] =='XX' :
            name[3]=0
        if name[3] ==''  :
            name[3]=0

        client2=Client.query.filter_by(NOM=str(name[43].lower())).first()
        if client2 is not None:
            name[43]=client2.id
        if name[43] =='XX' :
            name[43]=0
        if name[43] ==''  :
            name[43]=0

        client3=Client.query.filter_by(NOM=str(name[20].lower())).first() 
        if client3 is not None:
            name[20]=client3.id
        if name[20] =='XX' :
            name[20]=0
        if name[20] ==''  :
            name[20]=0

        expert1=Expert.query.filter_by(NOM=str(name[17].lower())).first()
        if expert1 is not None:
            name[17]=expert1.id
        if name[17] =='XX' :
            name[17]=0
        if name[17] ==''  :
            name[17]=0

        expert2=Expert.query.filter_by(NOM=str(name[11].lower())).first()
        if expert2 is not None:
            name[11]=expert2.id
        if name[11] =='XX' :
            name[11]=0
        if name[11] ==''  :
            name[11]=0

        expert3=Expert.query.filter_by(NOM=str(name[37].lower())).first()
        if expert3 is not None:
            name[37]=expert3.id
        if name[37] =='XX'  :
            name[37]=0
        if name[37] ==''  :
            name[37]=0

        expert4=Expert.query.filter_by(NOM=str(name[39].lower())).first()
        if expert4 is not None:
            name[39]=expert4.id
        if name[39] =='XX' :
            name[39]=0
        if name[39] ==''  :
            name[39]=0

        expert5=Expert.query.filter_by(NOM=str(name[69].lower())).first()
        if expert5 is not None:
            name[69]=expert5.id
        if name[69] =='XX'  :
            name[69]=0
        if name[69] ==''  :
            name[69]=0

        expert6=Expert.query.filter_by(NOM=str(name[71].lower())).first()
        if expert6 is not None:
            name[71]=expert6.id
        if name[71] =='XX'   :
            name[71]=0
        if name[71] ==''  :
            name[71]=0

        expert7=Expert.query.filter_by(NOM=str(name[73].lower())).first()
        if expert7 is not None:
            name[73]=expert7.id
        if name[73] =='XX' :
            name[73]=0
        if name[73] ==''  :
            name[73]=0

        expert8=Expert.query.filter_by(NOM=str(name[75].lower())).first()
        if expert8 is not None:
            name[75]=expert8.id
        if name[75] =='XX'  :
            name[75]=0
        if name[75] ==''  :
            name[75]=0

        expert9=Expert.query.filter_by(NOM=str(name[77].lower())).first()
        if expert9 is not None:
            name[77]=expert9.id
        if name[77] =='XX' :
            name[77]=0
        if name[77] ==''  :
            name[77]=0

        expert10=Expert.query.filter_by(NOM=str(name[79].lower())).first()
        if expert10 is not None:
            name[79]=expert10.id
        if name[79] =='XX'   :
            name[79]=0
        if name[79] ==''  :
            name[79]=0

        expert11=Expert.query.filter_by(NOM=str(name[81].lower())).first()
        if expert11 is not None:
            name[81]=expert11.id
        if name[81] =='XX' :
            name[81]=0
        if name[81] ==''  :
            name[81]=0

        expert12=Expert.query.filter_by(NOM=str(name[83].lower())).first()
        if expert12 is not None:
            name[83]=expert12.id
        if name[83] =='XX':
            name[83]=0
        if name[83] ==''  :
            name[83]=0
        
        box=tuple(name)

        mission=Mission(name[3],name[8],name[11],name[12],name[13],name[14],name[15],name[17],name[20],name[25],name[26],name[27],name[28],name[29],name[30],name[31],name[32],name[33],name[34],name[35],name[36],name[37],name[38],name[39],
        name[40],name[41],name[43],name[44],name[45],name[46],name[47],name[48],name[49],name[50],name[51],name[52],name[53],name[54],name[55],name[56],name[57],name[58],name[59],name[60],
        name[61],name[62],name[63],name[64],name[65],name[66],name[67],name[68],name[69],name[70],name[71],name[72],name[73],name[74],name[75],name[76],name[77],name[78],name[79],name[80],name[81],
        name[82],name[83],name[84])

        db.session.add(mission)
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




#name=['BRACHET SEBASTIEN']


#client1=Client.query.all()
#if client1 :
   # name[0]=client1.id

#print(client1)




























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
