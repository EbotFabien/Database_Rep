from data_base_ import db
from data_base_.Models import Tarifs,Chiffrage,Mission,Client,Expert
import xlrd

def insert_client(A):
    loc = ("C:/Users/user/Downloads/Base histo missions EDL 2020-08.xlsx")
    
    wb = xlrd.open_workbook(loc)
    sheet = wb.sheet_by_index(0)
    
    sheet.cell_value(0, 0)
    for i in range(0,50):
        name=sheet.row_values(i+1)
        
        if A == 'Bailleur':
            
            if name[3] == '' or name[3] == 'XX':
                print('no data here')
            else:
                cli=Client.query.filter_by(NOM=str(name[3])).first()
                if cli is None:
                    client=Client('BAILLEUR',name[1],name[2],name[3],'TEST@gmail.com','1234567',name[4],name[5],name[6],name[7],'','')
                    db.session.add(client)
                    db.session.commit()
                    client.Reference = int(name[0])
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Prop':
            if name[43] == '' or name[43] == 'XX':
                print('no data here')
            else:
                cli=Client.query.filter_by(NOM=str(name[43])).first()
                if cli is None:
                    cli2=Client('BAILLEUR','',name[42],name[43],'TEST@gmail.com','1234567','','','','','','')
                    db.session.add(cli2)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Locataire':
            if name[20] == '' or name[20] == 'XX':
                print('no data here')
            else:
                cli1=Client.query.filter_by(Reference=int(name[18])).first()    
                if cli1 is None:
                    client=Client('LOCATAIRE','',name[19],name[20],'TEST@gmail.com','1234567',name[21],name[22],name[23],name[24],'','G12348966')
                    db.session.add(client)
                    db.session.commit()
                    client.Reference = int(name[18])
                    db.session.commit()

                else:
                    print('already exist')


def expert_(A):
    loc = ("C:/Users/user/Downloads/Base histo missions EDL 2020-08.xlsx")

    wb = xlrd.open_workbook(loc)
    sheet = wb.sheet_by_index(0)

    sheet.cell_value(0, 0)
    for i in range(0,50):
        name=sheet.row_values(i+1)
        if A == 'Interv':
            if name[17] == '' or name[17] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[17])).first()
                if cli is None:
                    expert=Expert(name[16],name[17],A,'test0001@gmail.com','1234567')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'CONCESS':
            if name[11] == '' or name[11] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[11])).first()
                if cli is None:
                    expert=Expert(name[10],name[11],A,'test0001@gmail.com','1234567')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Manager_chiffrage':
            if name[37] == '' or name[37] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[37])).first()
                if cli is None:
                    expert=Expert('',name[37],A,'test0001@gmail.com','1234567')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')
        
        if A == 'Agent_chiffrage':
            if name[39] == '' or name[39] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[39])).first()
                if cli is None:
                    expert=Expert('',name[39],A,'test0001@gmail.com','1234567')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Respon Cell Dev':
            if name[69] == '' or name[69] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[69])).first()
                if cli is None:
                    expert=Expert('',name[69],A,'test0001@gmail.com','1234567')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        

        if A == 'agent Cell Dev':
            if name[71] == '' or name[71] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[71])).first()
                if cli is None:
                    expert=Expert('',name[71],A,'test0001@gmail.com','1234567')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Agent CellTech':
            if name[73] == '' or name[73] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[73])).first()
                if cli is None:
                    expert=Expert('',name[73],A,'test0001@gmail.com','1234567')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Respon Cell Tech':
            if name[75] == '' or name[75] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[75])).first()
                if cli is None:
                    expert=Expert('',name[75],A,'test0001@gmail.com','1234567')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Suiveur Cell Tech':
            if name[77] == '' or name[77] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[77])).first()
                if cli is None:
                    expert=Expert('',name[77],A,'test0001@gmail.com','1234567')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Respon Cell Planif':
            if name[79] == '' or name[79] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[79])).first()
                if cli is None:
                    expert=Expert('',name[79],A,'test0001@gmail.com','1234567')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Suiveur Cell Planif':
            if name[81] == '' or name[81] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[81])).first()
                if cli is None:
                    expert=Expert('',name[81],A,'test0001@gmail.com','1234567')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')

        if A == 'Agent saisie Cell Planif':
            if name[83] == '' or name[83] == 'XX':
                print('no data here')
            else:
                cli=Expert.query.filter_by(NOM=str(name[83])).first()
                if cli is None:
                    expert=Expert('',name[81],A,'test0001@gmail.com','1234567')
                    db.session.add(expert)
                    db.session.commit()
                else:
                    print('already exist')
        


def Missions():
    loc = ("C:/Users/user/Downloads/Base histo missions EDL 2020-08.xlsx")

    wb = xlrd.open_workbook(loc)
    sheet = wb.sheet_by_index(0)

    sheet.cell_value(0, 0)
    for i in range(0,50):
        name=sheet.row_values(i+1)
        
        client1=Client.query.filter_by(NOM=str(name[3])).first()
        if client1 is not None:
            name[3]=client1.id
        if name[3] =='XX' :
            name[3]=0
        if name[3] ==''  :
            name[3]=0

        client2=Client.query.filter_by(NOM=str(name[43])).first()
        if client2 is not None:
            name[43]=client2.id
        if name[43] =='XX' :
            name[43]=0
        if name[43] ==''  :
            name[43]=0

        client3=Client.query.filter_by(NOM=str(name[20])).first() 
        if client3 is not None:
            name[20]=client3.id
        if name[20] =='XX' :
            name[20]=0
        if name[20] ==''  :
            name[20]=0

        expert1=Expert.query.filter_by(NOM=str(name[17])).first()
        if expert1 is not None:
            name[17]=expert1.id
        if name[17] =='XX' :
            name[17]=0
        if name[17] ==''  :
            name[17]=0

        expert2=Expert.query.filter_by(NOM=str(name[11])).first()
        if expert2 is not None:
            name[11]=expert2.id
        if name[11] =='XX' :
            name[11]=0
        if name[11] ==''  :
            name[11]=0

        expert3=Expert.query.filter_by(NOM=str(name[37])).first()
        if expert3 is not None:
            name[37]=expert3.id
        if name[37] =='XX'  :
            name[37]=0
        if name[37] ==''  :
            name[37]=0

        expert4=Expert.query.filter_by(NOM=str(name[39])).first()
        if expert4 is not None:
            name[39]=expert4.id
        if name[39] =='XX' :
            name[39]=0
        if name[39] ==''  :
            name[39]=0

        expert5=Expert.query.filter_by(NOM=str(name[69])).first()
        if expert5 is not None:
            name[69]=expert5.id
        if name[69] =='XX'  :
            name[69]=0
        if name[69] ==''  :
            name[69]=0

        expert6=Expert.query.filter_by(NOM=str(name[71])).first()
        if expert6 is not None:
            name[71]=expert6.id
        if name[71] =='XX'   :
            name[71]=0
        if name[71] ==''  :
            name[71]=0

        expert7=Expert.query.filter_by(NOM=str(name[73])).first()
        if expert7 is not None:
            name[73]=expert7.id
        if name[73] =='XX' :
            name[73]=0
        if name[73] ==''  :
            name[73]=0

        expert8=Expert.query.filter_by(NOM=str(name[75])).first()
        if expert8 is not None:
            name[75]=expert8.id
        if name[75] =='XX'  :
            name[75]=0
        if name[75] ==''  :
            name[75]=0

        expert9=Expert.query.filter_by(NOM=str(name[77])).first()
        if expert9 is not None:
            name[77]=expert9.id
        if name[77] =='XX' :
            name[77]=0
        if name[77] ==''  :
            name[77]=0

        expert10=Expert.query.filter_by(NOM=str(name[79])).first()
        if expert10 is not None:
            name[79]=expert10.id
        if name[79] =='XX'   :
            name[79]=0
        if name[79] ==''  :
            name[79]=0

        expert11=Expert.query.filter_by(NOM=str(name[81])).first()
        if expert11 is not None:
            name[81]=expert11.id
        if name[81] =='XX' :
            name[81]=0
        if name[81] ==''  :
            name[81]=0

        expert12=Expert.query.filter_by(NOM=str(name[83])).first()
        if expert12 is not None:
            name[83]=expert12.id
        if name[83] =='XX':
            name[83]=0
        if name[83] ==''  :
            name[83]=0
        
        box=tuple(name)

        mission=Mission(name[0],name[1],name[2],name[3],name[4],name[5],name[6],name[7],name[8],name[9],name[10],name[11],name[12],name[13],name[14],name[15],name[16],name[17],name[18],
        name[19],name[20],name[21],name[22],name[23],name[24],name[25],name[26],name[27],name[28],name[29],name[30],name[31],name[32],name[33],name[34],name[35],name[36],name[37],name[38],name[39],
        name[40],name[41],name[42],name[43],name[44],name[45],name[46],name[47],name[48],name[49],name[50],name[51],name[52],name[53],name[54],name[55],name[56],name[57],name[58],name[59],name[60],
        name[61],name[62],name[63],name[64],name[65],name[66],name[67],name[68],name[69],name[70],name[71],name[72],name[73],name[74],name[75],name[76],name[77],name[78],name[79],name[80],name[81],
        name[82],name[83],name[84])

        db.session.add(mission)
        db.session.commit()

        #print(box)




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
