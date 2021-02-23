from data_base_ import db
from data_base_.Models import Tarifs,Chiffrage,Mission,Client,Expert
import openpyxl

def insert_client(A):
    loc = ("C:/Users/user/Downloads/Base histo missions EDL 2020-08.xlsx")
    wb_obj = openpyxl.load_workbook(loc)
    sheet=wb_obj.active
    #wb_obj = openpyxl.load_workbook(loc)
    #sheet=wb_obj.active

    #mission_=list(Mission.query.all())
    #for i in mission:
    #print(mission_[0].id)
    #for i in range(1,500):
     #   for a in range(0,500):
      #      mission_[a].DATE_REALISE_EDL =sheet["M"][i].value
       #     mission_[a].Date_chiffrage_regle =sheet["AG"][i].value
        #    mission_[a].DATE_FACTURE = sheet["AP"][i].value
         #   mission_[a].DATE_FACT_REGLEE = sheet["AS"][i].value
          #  db.session.commit()
        #print(sheet["AS"][i].value)