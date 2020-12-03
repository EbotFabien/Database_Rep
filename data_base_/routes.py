from flask import Flask,render_template,url_for,flash,redirect,request,Blueprint
from data_base_.Models import  db,Tarifs,Chiffrage,Mission,Client,Expert,Agenda,Facturation
from data_base_.forms import (RegistrationForm , LoginForm ,tableform,Client_Form,Facturation_Form,Chiffrage_Form)
from data_base_ import bcrypt
from data_base_.data  import Missions,expert_,insert_client
from sqlalchemy import or_, and_
from flask_login import login_user,current_user,logout_user,login_required,LoginManager

users =Blueprint('users',__name__)

@users.route('/client')
@login_required
def client():
    if current_user.TYPE == "Admin":
        client_=list(Client.query.all())
        return render_template('manage/pages/client.html',Client=client_,legend="client")

    
    return redirect(url_for('users.main'))

@users.route('/ajouter/client',methods=['GET','POST'])
@login_required
def ajouter_client():
    if current_user.TYPE == "Admin":
        form=Client_Form()
        if form.validate_on_submit():
            user=Client(form.Type.data,form.Societe.data,form.Titre.data,form.NOM.data,form.email.data,form.Numero.data,
            form.Adresse1.data,form.Adresse2.data,form.CP.data,form.Ville.data,form.Pays.data,form.Numero_de_compte.data)
            db.session.add(user)
            db.session.commit()
            db.session.commit()
           # flash(f'Client cree avec succes','success')
            return redirect(url_for('users.client'))
            
        return render_template('manage/pages/ajouter_client.html',form=form,legend="client")
    else:
        return redirect(url_for('users.main'))
   

@users.route('/facturation')
@login_required
def facturation():
    if current_user.TYPE == "Admin":
        facturation_=list(Facturation.query.all())
        return render_template('manage/pages/facturation.html',legend="facturation",Facturation=facturation_)

    return redirect(url_for('users.main'))

@users.route('/ajouter/facturation',methods=['GET','POST'])
@login_required
def ajouter_facturation():
    if current_user.TYPE == "Admin" :
        form=Facturation_Form()
        if form.validate_on_submit():
            user=Facturation(form.Pays.data,form.ID_Destinataire.data,form.ID_expediteur,form.montant.data,form.TVA.data,form.total.data,form.Type_.data,form.ID_proprietaire.data,form.ID_locataire.data,form.ville.data,
            form.surface.data,form.tarifs.data,form.appt_pav.data)
            db.session.add(user)
            db.session.commit()
            #db.session.commit()
        return render_template('manage/pages/ajouter_facturation.html',form=form, legend="facturation")
    else:
        return redirect(url_for('users.main'))

@users.route('/mission')
@login_required
def mission():
    if current_user.TYPE == "Admin":
        mission_=list(Mission.query.all())
        print(mission_)
        return render_template('manage/pages/mission.html',Mission=mission_,legend="mission")

    return redirect(url_for('users.main'))

@users.route('/expert')
@login_required
def expert():
    if current_user.TYPE == "Admin":
        expert_=list(Expert.query.all()) 
        return render_template('manage/pages/expert.html',Expert=expert_, legend="expert")

    return redirect(url_for('users.main'))

@users.route('/ajouter/expert',methods=['GET','POST'])
@login_required
def ajouter_expert():
    if current_user.TYPE == 'Admin':
        form = RegistrationForm()
        if form.validate_on_submit():
            hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
            user=Expert(titre=form.Titre.data,nom=form.username.data,numero=form.Numero.data,Type=form.Type_Expert.data, email=form.email.data )
            db.session.add(user)
            db.session.commit()
            user.password=hashed_password
            db.session.commit()
            return redirect(url_for('users.expert'))
        return render_template('manage/pages/ajouter_expert.html',form=form, legend="expert")
    else:
        return redirect(url_for('users.main'))


@users.route('/tarifs')
@login_required
def tarifs():
    if current_user.TYPE == "Admin":
        tarifs_=list(Tarifs.query.all())
        return render_template('Data.html',legend="tarifs",Tarifs=tarifs_)

    return redirect(url_for('users.main'))

@users.route('/chiffrage')
@login_required
def chiffrage():
    if current_user.TYPE == "Admin" or current_user.TYPE == "CONCESS":
        chiffrage_=list(Chiffrage.query.all())
        return render_template('manage/pages/chiffrage.html',legend="chiffrage",Chiffrage=chiffrage_)

    return redirect(url_for('users.main'))

@users.route('/ajoutez/chiffrage',methods=['GET','POST'])
@login_required
def ajouter_chiffrage():
    if current_user.TYPE == "Admin" or  current_user.TYPE == "CONCESS":
        form=Chiffrage_Form()
        if form.validate_on_submit():
            chiffrge=Chiffrage(mission=form.Mission.data,type_expert=form.Type_expert.data,pourcentage_gain=form.Pourcentage_gain.data)
            db.session.add(chiffrge)
            db.session.commit()
            #chiffrge.Mission=form.Mission.data
            #db.session.commit()
        return render_template('manage/pages/ajouter_chiffrage.html',form=form, legend="chiffrage")
    else:
        return redirect(url_for('users.main'))

@users.route('/agenda')
@login_required
def agenda():
    if current_user.TYPE == "Audit":
        agenda_=list(Agenda.query.all())
        return render_template('manage/pages/agenda.html',legend="agenda",Agenda=agenda_)

    return redirect(url_for('users.main'))

#@users.route('/ajoutez/agenda')
#@login_required
#def ajouter_agenda ():
   # if current_user.TYPE == "Admin" or  current_user.TYPE == "CONCESS" or current_user.TYPE == "Audit":
        # agenda_=list(Agenda.query.all())
       # return render_template('manage/pages/ajouter_agenda.html', legend="agenda")

    #return redirect(url_for('users.main'))

@users.route('/sign_up',methods=['GET','POST'])
def sign_up():
    if current_user.is_authenticated:
       return redirect(url_for('users.main'))
    form = RegistrationForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        user=Expert(titre=form.Titre.data,nom=form.username.data,numero=form.Numero.data,Type=form.Type_Expert.data, email=form.email.data )
        db.session.add(user)
        db.session.commit()
        user.password=hashed_password
        db.session.commit()
        flash(f'Account created you can now login','success')
        return redirect(url_for('users.login'))
    return render_template('signup.html',legend="sign_up",form=form)


@users.route('/login',methods=['GET','POST'])
def login():

    #expert=Expert('Mr.','Audit','Audit','test0001@gmail.com','1234567')
    #db.session.add(expert)
    #db.session.commit()
    #expert=Expert.query.filter_by(NOM="DETOC XAVIER").first()
    #hashed_password = bcrypt.generate_password_hash('12345').decode('utf-8')
    #expert.password = hashed_password
    #db.session.commit()
     #db.drop_all()
    #db.create_all()
    #expert__('Interv')
    #expert__('CONCESS')
    #expert__('Manager_chiffrage')
    #expert__('Agent_chiffrage')
    ##expert__('Respon Cell Dev')
    #expert__('agent Cell Dev')
    #expert__('Agent CellTech')
    #expert__('Respon Cell Tech')
    #expert__('Suiveur Cell Tech')
    #expert__('Respon Cell Planif')
    #expert__('Suiveur Cell Planif')
    #expert__('Agent saisie Cell Planif')
    #insert_client('Bailleur')
    #insert_client('Locataire')
    #insert_client('Prop')
    #Missions()
    #loc = ("C:/Users/user/Downloads/Base histo missions EDL 2020-08.xlsx")
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

    if current_user.is_authenticated:
       return redirect(url_for('users.main'))
    form = LoginForm()
    if form.validate_on_submit():
        name=Expert.query.filter_by(NOM=form.username.data).first()
        if  name and bcrypt.check_password_hash(name.password,form.password.data):
            login_user(name)
            next_page=request.args.get('next')
            return redirect (next_page) if next_page else  redirect(url_for('users.main'))
        else:
            flash(f'Mauvais e-mail ou mot de passe, essayez à nouveau','danger')

    return render_template('signup.html',legend="login",form=form)

@users.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('users.login'))

@users.route('/update', methods = ['GET', 'POST'])
def update():
    if request.method == 'POST':
        my_data = Client.query.get(request.form.get('id'))
  
        my_data.NOM = request.form['name']
        my_data.EMAIL = request.form['email']
        my_data.NUMERO = request.form['phone']
  
        db.session.commit()
        flash("Employee Updated Successfully")
        return redirect(url_for('users.client'))
    return redirect(url_for('users.client'))

@users.route('/ajoutez/agenda', methods = ['GET', 'POST'])
def ajout_agenda():
    if request.method == 'POST':
        print('ok1')
        client = Client.query.get(request.form.get('id'))
        #expert_audit=Expert.query.filter(and_(Expert.NOM == str(current_user.NOM), Expert.TYPE =='audit_planner')).first() #type='audit_planner'
        agen=Agenda(client.id,int(request.form['Audit_planner']),int(request.form['Agent_referent']),
        request.form['Lieu'],request.form['Date'])
        db.session.add(agen)
        db.session.commit()
        return redirect(url_for('users.agenda'))
    return render_template('manage/pages/ajouter_agenda.html', legend="agenda")
    #return redirect(url_for('users.client'))

@users.route('/delete/<int:id>/<string:type1>', methods = ['GET', 'POST'])
def delete(id,type1):
    if type1 == 'client':
        my_data = Client.query.get(id)
        db.session.delete(my_data)
        db.session.commit()
        flash("Client Deleted Successfully")
        return redirect(url_for('users.client'))

    if type1 == 'expert':
        my_data = Expert.query.get(id)
        db.session.delete(my_data)
        db.session.commit()
        flash("Client Deleted Successfully")
        return redirect(url_for('users.client'))

    if type1 == 'mission':
        my_data = Mission.query.get(id)
        db.session.delete(my_data)
        db.session.commit()
        flash("Client Deleted Successfully")
        return redirect(url_for('users.client'))

    if type1 == 'tarifs':
        my_data = Tarifs.query.get(id)
        db.session.delete(my_data)
        db.session.commit()
        flash("Client Deleted Successfully")
        return redirect(url_for('users.client'))

    if type1 == 'chiffrage':
        my_data = Chiffrage.query.get(id)
        db.session.delete(my_data)
        db.session.commit()
        flash("Client Deleted Successfully")
        return redirect(url_for('users.client'))

    if type1 == 'agenda':
        my_data = Agenda.query.get(id)
        db.session.delete(my_data)
        db.session.commit()
        flash("Client Deleted Successfully")
        return redirect(url_for('users.client'))

    if type1 == 'facturation':
        my_data = Facturation.query.get(id)
        db.session.delete(my_data)
        db.session.commit()
        flash("Client Deleted Successfully")
        return redirect(url_for('users.client'))
    
    return redirect(url_for('users.client'))

@users.route('/',methods=['GET','POST'])
@login_required
def main():
    if current_user.is_authenticated:
        form = tableform()
        expert_admin=Expert.query.filter(and_(Expert.NOM == str(current_user.NOM), Expert.TYPE =='Admin')).first() #type='admin'
        expert_concess=Expert.query.filter(and_(Expert.NOM == str(current_user.NOM), Expert.TYPE =='CONCESS')).first() #type='Concess'
        expert_audit=Expert.query.filter(and_(Expert.NOM == str(current_user.NOM), Expert.TYPE =='audit_planner')).first() #type='audit_planner'
    # hashed_password = bcrypt.generate_password_hash('12345').decode('utf-8')
    # expert_admin.password = hashed_password
        #db.session.commit()

        clients=list(Client.query.all())
        
        if current_user.is_authenticated and  expert_admin :
            if form.validate_on_submit:
                data=form.table.data
                if data == "mission":
                    return redirect(url_for('users.mission'))
                if data == "client":
                    return redirect(url_for('users.client'))
                if data == "expert":
                    return redirect(url_for('users.expert'))
                if data == "facturation":
                    return redirect(url_for('users.facturation'))
                if data == "chiffrage":
                    return redirect(url_for('users.chiffrage'))
                if data == "tarifs":
                    return redirect(url_for('users.tarifs'))
                if data == "expert":
                    return redirect(url_for('users.expert'))
                if data == "agenda":
                    return redirect(url_for('users.agenda'))
        
        if current_user.is_authenticated and  expert_concess :
            if form.validate_on_submit:
                data=form.table.data
                if data == "chiffrage":
                    return redirect(url_for('users.chiffrage'))
                if data == "agenda":
                    return redirect(url_for('users.agenda'))

        if current_user.is_authenticated and  expert_audit :
            if form.validate_on_submit:
                data=form.table.data
                if data == "agenda":
                    return redirect(url_for('users.agenda'))

        else:
            #flash(f"Vous n'est pas autorise a acceder cette table",'danger')
            return render_template('manage/dashboard.html',title='Portail',form=form, clients=clients)
    return redirect(url_for('users.login'))


@users.app_errorhandler(404)
def error_404(error):
    return render_template('errors/404.html'),404

@users.app_errorhandler(403)
def error_403(error):
    return render_template('errors/403.html'),403
 
@users.app_errorhandler(500)
def error_500(error):
    return render_template('errors/500.html'),500
