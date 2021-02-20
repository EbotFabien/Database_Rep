from flask import Flask,render_template,url_for,flash,redirect,request,Blueprint
from Database_project.project.data_base_.Models import db,Tarifs,Mission,Client,Expert,Agenda,Facturation,Expert_History,Client_History,Client_negotiateur,Negotiateur_History,suivi_client,prospect,prospect_History,prospect,suivi_client,suivi_prospect
from Database_project.project.data_base_.forms import (RegistrationForm , LoginForm ,tableform,Client_Form,Facturation_Form,Chiffrage_Form, Tarif_Form,RequestResetForm,ResetPasswordForm,Suivi_Client,Expert_editForm)
from Database_project.project.data_base_ import bcrypt
from Database_project.project.data_base_.data  import Missions,expert__,insert_client,mission_date
from Database_project.project.data_base_.utils import send_reset_email
from sqlalchemy import or_, and_, desc,asc
from flask_login import login_user,current_user,logout_user,login_required,LoginManager
import os
from Database_project.project.data_base_ import create_app
from os.path import join, dirname, realpath

users =Blueprint('users',__name__)
app= create_app()

@users.route('/client')
@login_required
def client():
    #db.create_all()
    if current_user.TYPE == "Admin":
        client_=list(Client.query.filter_by(visibility=True).all())
        return render_template('manage/pages/client.html',cli_ent=client_,legend="client")

    
    return redirect(url_for('users.main'))

@users.route('/ajouter/client',methods=['GET','POST'])
@login_required
def ajouter_client():
    if current_user.TYPE == "Admin":
        form=Client_Form()
        if form.validate_on_submit():
            user=Client(TYPE=form.Type.data,societe=form.Societe.data,sexe=form.Sexe.data,nom=form.NOM.data,email=form.email.data,numero=form.Numero.data,siret=form.Siret.data)
            db.session.add(user)
            db.session.commit()
            user_history=Client.query.filter(or_(Client.email == form.email.data,Client.nom == form.NOM.data)).first()
            user_his=Client_History(client_id=user_history.id,adresse=form.Adresse.data,cp=form.CP.data,ville=form.Ville.data,pays=form.Pays.data)
            db.session.add(user_his)
            db.session.commit()
            flash(f'Client créé avec succès','success')
            return redirect(url_for('users.client'))
        print("didn't validate on submit")    
        return render_template('manage/pages/ajouter_client.html',form=form,legend="client")
    else:
        return redirect(url_for('users.main'))

@users.route('/suivi/<int:id>/client')
@login_required
def suivi_client_(id):
    if current_user.TYPE == "Admin":
        suivi_=list(suivi_client.query.filter(and_(suivi_client.client==id,suivi_client.visibility==True)).all())

        return render_template('manage/pages/suivi_c.html',Suivi=suivi_,ID=id,legend="client")

    return redirect(url_for('users.main'))

@users.route('/ajouter/<int:id>/suivi_client',methods=['GET','POST'])
@login_required
def ajouter_suivic(id):
    if current_user.TYPE == "Admin":
        form=Suivi_Client()
        client = Client.query.filter_by(id=id).first_or_404()
        if form.validate_on_submit():
            suivi=suivi_client(client.id,current_user.id,form.commentaire.data)
            db.session.add(suivi) 
            db.session.commit()
            flash(f'suivi Client créé avec succès','success')
            return redirect(url_for('users.suivi_client_', id=id))
        return render_template('manage/pages/ajouter_suivi.html',form=form,ID=id,legend="client")
    #return function 

@users.route('/delete/<int:id>/suivi_client', methods=['GET'])
@login_required
def delete_suivi(id):
    if current_user.TYPE == "Admin":
        suivi = suivi_client.query.filter_by(id=id).first_or_404()
        suivi.visibility=False
        db.session.commit()
        flash(f'Le suivi client a été  suprimmer','success')
        return redirect(url_for('users.suivi_client_', id=suivi.client))
    return redirect(url_for('users.client'))

@users.route('/edit/<int:id>/suivi_client', methods=['GET'])
@login_required
def edit_suivi(id):
    if current_user.TYPE == "Admin":
        form = Suivi_Client()
        suivi = suivi_client.query.filter_by(id=id).first_or_404()
        if current_user.id == suivi.responsable:
            return render_template('manage/pages/edit_suivi.html', suivi=suivi,form=form)
        else:
            flash(f'Vous ne pouvez pas modifier ce suivi','warning')
            return redirect(url_for('users.suivi_client_', id=suivi.client))
    return redirect(url_for('users.client'))

@users.route('/update/<int:id>/suivi_client', methods=['POST', 'PUT'])
@login_required
def update_suivi(id):
    if current_user.TYPE == 'Admin':
        suivi = suivi_client.query.filter_by(id=id).first_or_404()
        suivi.commentaire = request.form['commentaire']
        db.session.commit()
        flash(f'Le suivi a été modifiées','success')
        return redirect(url_for('users.suivi_client_', id=suivi.client))
    return redirect(url_for('users.client'))

@users.route('/show/<int:id>/client', methods=['GET'])
@login_required
def show_client(id):
    if current_user.TYPE == "Admin":
        client = Client.query.filter_by(id=id).first_or_404()
        client_history=Client_History.query.filter_by(client_id=id).order_by(asc(Client_History.date)).first_or_404()
        return render_template('manage/pages/show_client.html', client=client,history=client_history,legend="client")



@users.route('/delete/<int:id>/client', methods=['GET'])
@login_required
def delete_client(id):
    if current_user.TYPE == "Admin":
        client = Client.query.filter_by(id=id).first_or_404()
        client_history=list(Client_History.query.filter_by(client_id=id).all())
        client.visibility=False
        db.session.commit()
        for i in client_history:
            i.visibility=False
            db.session.commit()
        flash(f'Les donnes du client ont été  suprimmer','success')
        return redirect(url_for('users.client'))

@users.route('/edit/<int:id>/client', methods=['GET'])
@login_required
def edit_client(id):
    if current_user.TYPE == "Admin":
        form = Client_Form()
        client = Client.query.filter_by(id=id).first_or_404()
        client_history=Client_History.query.filter_by(client_id=id).order_by(asc(Client_History.date)).first_or_404()
        return render_template('manage/pages/edit_client.html', client=client,history=client_history,form=form,legend="client")

@users.route('/update/<int:id>/client', methods=['POST','GET'])
@login_required
def update_client(id):
    if current_user.TYPE == "Admin":
        client = Client.query.filter_by(id=id).first_or_404()
        if request.form['Ville'] or  request.form['Pays'] or request.form['CP'] or  request.form['Adresse'] :
            client_check=Client_History(client_id=id)
            db.session.add(client_check)
            db.session.commit()
            client_history=Client_History.query.filter_by(client_id=id).order_by(asc(Client_History.date)).first_or_404()
            client_history.ville = request.form['Ville']
            client_history.pays = request.form['Pays']
            client_history.cp = request.form['CP']
            client_history.adresse = request.form['Adresse']
            db.session.commit()
            

        client.email = request.form['email']
        client.societe = request.form['Societe']
        client.numero = request.form['Numero']
        client.sexe = request.form['Sexe']
        client.TYPE = request.form['Type']
        client.nom = request.form['NOM']
        db.session.commit()
        flash(f'Les donnes du client a été modifiées','success')
        return redirect(url_for('users.client', id=id))
    return redirect(url_for('users.edit_client', id=id))
       

@users.route('/facturation')
@login_required
def facturation():
    if current_user.TYPE == "Admin":
        facturation_=list(Facturation.query.filter_by(Visibility=True).all())
        return render_template('manage/pages/facturation.html',legend="facturation",Facturation=facturation_)

    return redirect(url_for('users.main'))

@users.route('/delete/<int:id>/facturation', methods=['GET'])
@login_required
def delete_facturation(id):
    if current_user.TYPE == "Admin":
        facturation = Facturation.query.filter_by(id=id).first_or_404()
        facturation.Visibility = False
        db.session.commit()
        flash(f'Les donnes de facturation ont été  suprimmer','success')
        return redirect(url_for('users.facturation'))

@users.route('/edit/<int:id>/facturation', methods=['GET'])
@login_required
def edit_facturation(id):
    if current_user.TYPE == "Admin":
        form = Facturation_Form()
        facturation = Facturation.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/edit_facturation.html', facturation=facturation,form=form)

@users.route('/update/<int:id>/facturation', methods=['POST', 'PUT'])
@login_required
def update_facturation(id):
    if current_user.TYPE == "Admin":
        facturation = Facturation.query.filter_by(id=id).first_or_404()
        facturation.Pays = request.form['Pays']
        facturation.Destinataire=request.form['ID_Destinataire']
        facturation.expéditeur=request.form['ID_expediteur']
        facturation.Montant=request.form['montant']
        facturation.Total=request.form['total']
        facturation.Type=request.form['Type_']
        facturation.Proprietaire=request.form['ID_proprietaire']
        facturation.Locataire=request.form['ID_locataire']
        facturation.Ville=request.form['ville']
        facturation.Surface=request.form['surface']
        facturation.Tarif=request.form['tarifs']
        facturation.Appt_Pav=request.form['appt_pav']
        db.session.commit()
        flash(f'Les donnes de facturation a été modifiées','success')
        return redirect(url_for('users.facturation'))

    return redirect(url_for('users.edit_client', id=id))
@users.route('/ajouter/facturation',methods=['GET','POST'])
@login_required
def ajouter_facturation():
    if current_user.TYPE == "Admin" :
        form=Facturation_Form()
        if form.validate_on_submit():
            user=Facturation(form.Pays.data,form.ID_Destinataire.data,form.ID_expediteur.data,form.montant.data,form.total.data,form.Type_.data,form.ID_proprietaire.data,form.ID_locataire.data,form.ville.data,
            form.surface.data,form.tarifs.data,form.appt_pav.data)
            db.session.add(user)
            db.session.commit()
            #db.session.commit()
            return redirect(url_for('users.facturation'))

        return render_template('manage/pages/ajouter_facturation.html',form=form, legend="facturation")
    else:
        return redirect(url_for('users.main'))

@users.route('/mission')
@login_required
def mission():
    if current_user.TYPE == "Admin":
        mission_=list(Mission.query.filter_by(Visibility=True).order_by(desc(Mission.id)).all())
        return render_template('manage/pages/mission.html',Mission=mission_,legend="mission")

    return redirect(url_for('users.main'))

@users.route('/delete/<int:id>/mission', methods=['GET'])
@login_required
def delete_mission(id):
    if current_user.TYPE == 'Admin':
        mission = Mission.query.filter_by(id=id).first_or_404()
        mission.Visibility=False
        db.session.commit()
        flash(f'Les donnes de mission ont été  suprimmer','success')
        return redirect(url_for('users.mission'))

@users.route('/expert')
@login_required
def expert():
    if current_user.TYPE == "Admin":
        expert_=list(Expert.query.filter_by(visibility=True).order_by(desc(Expert.id)).all()) 
        return render_template('manage/pages/expert.html',Expert=expert_, legend="expert")

    return redirect(url_for('users.main'))

@users.route('/show/<int:id>/expert', methods=['GET'])
@login_required 
def show_expert(id):
    if current_user.TYPE == "Admin":
        expert = Expert.query.filter_by(id=id).first_or_404()
        client_history=Expert_History.query.filter_by(expert_id=id).order_by(asc(Expert_History.date)).first_or_404()
        return render_template('manage/pages/show_expert.html', expert=expert,history=client_history,legend="expert")


@users.route('/ajouter/expert',methods=['GET','POST'])
@login_required
def ajouter_expert():
    if current_user.TYPE == 'Admin':
        form = RegistrationForm()
        if form.validate_on_submit():
            hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
            user=Expert(sexe=form.Sexe.data,nom=form.username.data,numero=form.Numero.data,TYPE=form.Type_Expert.data, email=form.email.data)
            db.session.add(user)
            db.session.commit()
            expert_check=Expert_History(expert_id=user.id)#check if tables are modified from table expert_history
            db.session.add(expert_check)
            user.password=hashed_password
            db.session.commit()
            return redirect(url_for('users.expert'))
        return render_template('manage/pages/ajouter_expert.html',form=form, legend="expert")
    else:
        return redirect(url_for('users.main'))

@users.route('/edit/<int:id>/expert', methods=['GET'])
@login_required
def edit_expert(id):
    if current_user.TYPE == 'Admin':
        form = Expert_editForm()
        expert = Expert.query.filter_by(id=id).first_or_404()
        expert_history=Expert_History.query.filter_by(expert_id=id).order_by(asc(Expert_History.date)).first_or_404()
        return render_template('manage/pages/edit_expert.html', form=form,history=expert_history,expert=expert)

@users.route('/delete/<int:id>/expert', methods=['GET'])
@login_required
def delete_expert(id):
    if current_user.TYPE == 'Admin':
        expert = Expert.query.filter_by(id=id).first_or_404()
        client_history=list(Expert_History.query.filter_by(expert_id=id).all())
        expert.visibility=False
        db.session.commit()
        for i in client_history:
            i.visibility=False
            db.session.commit()
        flash(f'Les donnes de l"expert ont été  suprimmer','success')
        return redirect(url_for('users.expert'))

@users.route('/update/<int:id>/expert', methods=['POST', 'PUT'])
@login_required
def update_expert(id):
    if current_user.TYPE == 'Admin':
        form = Expert_editForm()
        expert = Expert.query.filter_by(id=id).first_or_404()
        print(47)
        if request.form['ville'] !=None: #or  request.form['type_certification'] !="None" or request.form['adresse'] !="None" or  request.form['cp'] !="None" or request.form['login_backof'] !="None" or request.form['pwd_backof'] !="None" or request.form['login_extranet'] !="None" or request.form['pwd_extranet'] !="None" or request.form['pwd_gsuite'] !="None" or request.form['observations_de_suivi'] !="None" :
        
            expert_check=Expert_History(expert_id=id)
            db.session.add(expert_check)
            db.session.commit()
            expert_history=Expert_History.query.filter_by(expert_id=id).order_by(asc(Expert_History.date)).first_or_404()
            expert_history.ville = request.form['ville']
            
            expert_history.type_certification =  request.form['type_certification']
            
            expert_history.cp = request.form['cp']
            expert_history.actif_parti  = request.form['actif_parti']
            
            expert_history.login_backof = request.form['login_backof']
            expert_history.pwd_backof = request.form['pwd_backof']
            
            expert_history.adresse = request.form['adresse']
            expert_history.login_extranet = request.form['login_extranet']
            expert_history.pwd_extranet = request.form['pwd_extranet']
            
            expert_history.pwd_gsuite = request.form['pwd_gsuite']
            expert_history.observations_de_suivi = request.form['observations_de_suivi']
            
            db.session.commit()
      
        expert.sexe= request.form['Sexe']
        expert.nom = request.form['username']
        expert.numero = request.form['Numero']
        expert.email = request.form['email']
        expert.siret= request.form['siret']
        expert.trigramme=request.form['trigramme']
        db.session.commit()

        flash(f'Les information de l\'expert a ete modifier', 'success')
        return redirect(url_for('users.expert'))
    return redirect(url_for('users.main'))

@users.route('/tarifs')
@login_required
def tarifs():
    if current_user.TYPE == "Admin":
        tarifs=list(Tarifs.query.filter_by(visibility=True).all())
        return render_template('manage/pages/tarif.html',legend="tarifs",tarifs=tarifs)

    return redirect(url_for('users.main'))


@users.route('/ajouter/tarifs/', methods=['GET','POST'])
@login_required
def ajouter_tarif():
    if current_user.TYPE == 'Admin':
        form = Tarif_Form()
        if form.validate_on_submit():
            tarif = Tarifs(form.ID_client.data,form.type_de_maison.data,form.remise.data,form.prix.data)
            db.session.add(tarif)
            db.session.commit()
            flash(f'Le tarif a été créé avec succès', 'success')
            return redirect(url_for('users.tarifs'))
        return render_template('manage/pages/ajouter_tarif.html',form=form, legend="expert")
    return redirect(url_for('users.main'))

@users.route('/delete/<int:id>/tarif')
@login_required
def delete_tarif(id):
    if current_user.TYPE == "Admin":
        tarif = Tarifs.query.filter_by(id=id).first_or_404()
        tarif.visibility = False
        db.session.commit()
        flash(f'Les donnes de Tarifs ont été  suprimmer','success')
        return redirect(url_for('users.tarifs'))

@users.route('/edit/<int:id>/tarif')
@login_required
def edit_tarif(id):
    if current_user.TYPE == "Admin":
        form = Tarif_Form()
        tarif = Tarifs.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/edit_tarif.html', tarif=tarif,form=form)

@users.route('/update/<int:id>/tarif', methods=['POST', 'PUT'])
@login_required
def update_tarif(id):
    if current_user.TYPE == 'Admin':
        tarif = Tarifs.query.filter_by(id=id).first_or_404()
        tarif.reference_client=request.form['ID_client']
        tarif.remise = request.form['remise']
        tarif.Prix = request.form['prix']
        tarif.type_maison = request.form['type_de_maison']
        db.session.commit()
        flash(f'Les donnes du tarif a été modifiées','success')
        return redirect(url_for('users.tarifs'))
    return redirect(url_for('users.edit_tarif', id=id))
       

@users.route('/chiffrage')
@login_required
def chiffrage():
    if current_user.TYPE == "Admin" or current_user.TYPE == "CONCESS":
        chiffrage_=list(Chiffrage.query.filter_by(visibility=True).all())
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
            flash(f'Le chiffrage a été créé avec succès', 'success')
            return redirect(url_for('users.chiffrage'))
        return render_template('manage/pages/ajouter_chiffrage.html',form=form, legend="chiffrage")
    else:
        return redirect(url_for('users.main'))

@users.route('/delete/<int:id>/chiffrage')
@login_required
def delete_chiffrage(id):
    if current_user.TYPE == "Admin" or  current_user.TYPE == "CONCESS":
        chiffrage = Chiffrage.query.filter_by(id=id).first_or_404()
        chiffrage.visibility=False
        db.session.commit()
        flash(f'Les donnes de chiffrage ont été  suprimmer','success')
        return redirect(url_for('users.chiffrage'))

@users.route('/edit/<int:id>/chiffrage')
@login_required
def edit_chiffrage(id):
    if current_user.TYPE == "Admin" or  current_user.TYPE == "CONCESS":
        form = Chiffrage_Form()
        chiffrage = Chiffrage.query.filter_by(id=id).first_or_404()
        return render_template('manage/pages/edit_chiffrage.html', chiffrage=chiffrage,form=form)

@users.route('/update/<int:id>/chiffrage', methods=['POST', 'PUT'])
@login_required
def update_chiffrage(id):
    if current_user.TYPE == 'Admin'  or  current_user.TYPE == "CONCESS":
        chiffrage = Chiffrage.query.filter_by(id=id).first_or_404()
        chiffrage.Mission = request.form['Mission']
        chiffrage.Type_expert = request.form['Type_expert']
        chiffrage.Pourcentage_gain = request.form['Pourcentage_gain']
        db.session.commit()
        flash(f'Les donnes du chiffrage a été modifiées','success')
        return redirect(url_for('users.chiffrage'))
    return redirect(url_for('users.edit_tarif', id=id))

@users.route('/agenda')
@login_required
def agenda():
    if current_user.TYPE == "Audit":
        agenda_=list(Agenda.query.filter_by(Visibility=True).all())
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

    #expert=Expert('Mr.','Admin','Admin','test0001@gmail.com','1234567')
    #db.session.add(expert)
    #db.session.commit()
    #expert=Expert.query.filter_by(nom="Admin").first()
    #expert.TYPE="Admin"
    #hashed_password = bcrypt.generate_password_hash('12345').decode('utf-8')
    #expert.password = hashed_password
   # db.session.commit()
    #db.drop_all()
    db.create_all()
    expert=Expert(sexe='Mr.',nom='Admin',numero=12345,TYPE='Admin', email='test0001@gmail.com' )
    db.session.add(expert)
    db.session.commit()
    hashed_password = bcrypt.generate_password_hash('12345').decode('utf-8')
    expert.password=hashed_password
    db.session.commit()

    if current_user.is_authenticated:
       return redirect(url_for('users.main'))
    form = LoginForm()
    if form.validate_on_submit():
        name=Expert.query.filter_by(nom=form.username.data).first()
        if  name and bcrypt.check_password_hash(name.password,form.password.data):
            login_user(name)
            next_page=request.args.get('next')
            return redirect (next_page) if next_page else  redirect(url_for('users.main'))
        else:
            flash(f'Mauvais e-mail ou mot de passe, essayez à nouveau','danger')

    return render_template('signup.html',legend="login",form=form)

@users.route('/forgot_password', methods=['GET','POST'])
def forgot_password ():
    if current_user.is_authenticated:
       return redirect(url_for('users.main'))
    form = RequestResetForm()
    if form.validate_on_submit():
        expert=Expert.query.filter_by(EMAIL=form.email.data).first()
        if expert:
            send_reset_email(expert)
            flash('An email has been sent with instructions to reset your Password.','info')
            return redirect(url_for('users.login'))
        if expert is None:
            flash('This email does not exist','warning')
            return redirect(url_for('users.forgot_password'))
    return render_template('forgot_password.html', form=form)

@users.route('/reset_password/<token>', methods=['GET','POST'])
def reset_password (token):
    if current_user.is_authenticated:
       return redirect(url_for('users.main'))
    expert = Expert.verify_reset_token(token)
    if expert is None:
        flash('That is an invalid or expired token','warning')
        return redirect(url_for('users.forgot_password'))
    form = ResetPasswordForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        expert.password = hashed_password
        db.session.commit()
        flash(f'your password has been updated! You are now able to login','success')
        return redirect(url_for('users.login'))
    return render_template('reset_password.html', form=form)

@users.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('users.login'))



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


@users.route('/',methods=['GET','POST'])
@login_required
def main():
    if current_user.is_authenticated:
        clients = Client.query.all()
        missions = list(Mission.query.all())
        facturations = list(Facturation.query.all())
        form = tableform()
        expert_admin=Expert.query.filter(and_(Expert.nom == str(current_user.nom), Expert.TYPE =='Admin')).first() #type='admin'
        expert_concess=Expert.query.filter(and_(Expert.nom == str(current_user.nom), Expert.TYPE =='CONCESS')).first() #type='Concess'
        expert_audit=Expert.query.filter(and_(Expert.nom == str(current_user.nom), Expert.TYPE =='audit_planner')).first() #type='audit_planner'
    # hashed_password = bcrypt.generate_password_hash('12345').decode('utf-8')
    # expert_admin.password = hashed_password
        #db.session.commit()

        # clients=list(Client.query.all())
        
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
            return render_template('manage/dashboard.html',title='Portail',form=form, clients=clients, missions=missions,facturations=facturations)
    return redirect(url_for('users.login'))

@users.route('/client/<int:id>/negotiateur')
@login_required
def negotiateur(id):
    if current_user.TYPE == "Admin":
        client_=list(Client_negotiateur.query.filter(and_(Client_negotiateur.client_id == id ,Client_negotiateur.visibility == True)).all())
        for c in client_:
            print(c.id)
        return render_template('manage/pages/negotiateur.html',Client=client_,ID=id,legend="negotiateur")
    
    return redirect(url_for('users.main'))



@users.route('/delete/<int:id>/negotiateur', methods=['GET'])
@login_required
def delete_negotiateur(id):
    if current_user.TYPE == "Admin":
        client = Client_negotiateur.query.filter_by(id=id).first_or_404()
        client_history=list(Negotiateur_History.query.filter_by(negotiateur_id=id).all())
        client.visibility=False
        db.session.commit()
        for i in client_history:
            i.visibility=False
            db.session.commit()
        flash(f'Les donnes du negotiateur ont été  suprimmer','success')
        return redirect(url_for('users.negotiateur', id=id))


@users.route('/ajouter/<int:id>/negotiateur',methods=['GET','POST'])
@login_required
def ajouter_negotiateur(id):
    if current_user.TYPE == "Admin":
        form=Client_Form()
        client=Client.query.filter_by(id=id).first_or_404()
        if form.validate_on_submit():
            user=Client_negotiateur(client.id,form.Type.data,form.Societe.data,form.Sexe.data,form.NOM.data,form.email.data,form.Numero.data,form.Siret.data)
            db.session.add(user)
            db.session.commit()
            user_history=Client_negotiateur.query.filter(or_(Client_negotiateur.email == form.email.data,Client_negotiateur.nom == form.NOM.data)).first()
            user_his=Negotiateur_History(negotiateur_id=user_history.id,adresse=form.Adresse.data,cp=form.CP.data,ville=form.Ville.data,pays=form.Pays.data)
            db.session.add(user_his)
            db.session.commit()
            flash(f'Negotiateur créé avec succès','success')
            return redirect(url_for('users.negotiateur', id=id)) #id check
        print("didn't validate on submit")    
        return render_template('manage/pages/ajouter_client.html',ID=id,form=form,legend="negociateur")
    else:
        return redirect(url_for('users.main'))



@users.route('/show/<int:id>/negotiateur', methods=['GET'])
@login_required
def show_negotiateur(id):
    if current_user.TYPE == "Admin":
        client = Client_negotiateur.query.filter_by(id=id).first_or_404()
        client_history=Negotiateur_History.query.filter_by(negotiateur_id=id).order_by(asc(Negotiateur_History.date)).first_or_404()
        return render_template('manage/pages/show_client.html', client=client,history=client_history,legend="negotiateur")


@users.route('/edit/<int:id>/negotiateur', methods=['GET'])
@login_required
def edit_negotiateur(id):
    if current_user.TYPE == "Admin":
        form = Client_Form()
        client = Client_negotiateur.query.filter_by(id=id).first_or_404()
        client_history=Negotiateur_History.query.filter_by(negotiateur_id=id).order_by(asc(Negotiateur_History.date)).first_or_404()
        return render_template('manage/pages/edit_negotiateur.html', client=client,history=client_history,form=form,legend="edit_negotiateur")

@users.route('/update/<int:id>/negotiateur', methods=['POST', 'PUT'])#fix pages for action on form
@login_required
def update_negotiateur(id):
    if current_user.TYPE == "Admin":
        client = Client_negotiateur.query.filter_by(id=id).first_or_404()
        if request.form['Ville'] or  request.form['Pays'] or request.form['CP'] or  request.form['Adresse'] :
            client_check=Negotiateur_History(negotiateur_id=id)
            db.session.add(client_check)
            db.session.commit()
            client_history=Negotiateur_History.query.filter_by(negotiateur_id=id).order_by(asc(Negotiateur_History.date)).first_or_404()
            client_history.ville = request.form['Ville']
            client_history.pays = request.form['Pays']
            client_history.cp = request.form['CP']
            client_history.adresse = request.form['Adresse']
            db.session.commit()

        client.email = request.form['email']
        client.societe = request.form['Societe']
        client.numero = request.form['Numero']
        client.sexe = request.form['Sexe']
        client.TYPE = request.form['Type']
        client.nom = request.form['NOM']

        db.session.commit()
        flash(f'Les donnes du negotiateur a été modifiées','success')
        return redirect(url_for('users.negotiateur', id=client.client_id))

    return redirect(url_for('users.edit_negotiateur', id=id))







@users.route('/prospect')
@login_required
def prospect_():
    if current_user.TYPE == "Admin":
        client_=list(prospect.query.filter_by(visibility=True).all())
        return render_template('manage/pages/prospect.html',Client=client_,legend="client")

    
    return redirect(url_for('users.main'))

@users.route('/ajouter/prospect',methods=['GET','POST'])
@login_required
def ajouter_prospect():
    if current_user.TYPE == "Admin":
        form=Client_Form()
        if form.validate_on_submit():
            user=prospect(form.Type.data,form.Societe.data,form.Sexe.data,form.NOM.data,form.email.data,form.Numero.data)
            db.session.add(user)
            db.session.commit()
            user_history=prospect.query.filter(or_(prospect.email==form.email.data,prospect.nom==form.NOM.data)).first()
            user_history.siret==form.Siret.data
            db.session.commit()
            print(user_history.id)
            user_his=prospect_History(prospect=user_history.id,adresse=form.Adresse.data,cp=form.CP.data,ville=form.Ville.data,pays=form.Pays.data)
            db.session.add(user_his)
            db.session.commit()
            flash(f'Prospect créé avec succès','success')
            return redirect(url_for('users.prospect_'))
        print("didn't validate on submit")    
        return render_template('manage/pages/ajouter_client.html',form=form,legend="prospect")
    else:
        return redirect(url_for('users.main'))



@users.route('/delete/<int:id>/prospect', methods=['GET'])
@login_required
def delete_prospect(id):
    if current_user.TYPE == "Admin":
        client = prospect.query.filter_by(id=id).first_or_404()
        client_history=list(prospect_History.query.filter_by(prospect=id).all())
        client.visibility=False
        db.session.commit()
        for i in client_history:
            i.visibility=False
            db.session.commit()
        flash(f'Les donnes du client ont été  suprimmer','success')
        return redirect(url_for('users.prospect_'))



@users.route('/show/<int:id>/prospect', methods=['GET'])
@login_required
def show_prospect(id):
    if current_user.TYPE == "Admin":
        client = prospect.query.filter_by(id=id).first_or_404()
        client_history=prospect_History.query.filter_by(prospect=id).order_by(asc(prospect_History.date)).first_or_404()
        return render_template('manage/pages/show_client.html', client=client,history=client_history,legend='prospect')


@users.route('/edit/<int:id>/prospect', methods=['GET'])
@login_required
def edit_prospect(id):
    if current_user.TYPE == "Admin":
        form = Client_Form()
        client = prospect.query.filter_by(id=id).first_or_404()
        client_history=prospect_History.query.filter_by(prospect=id).order_by(asc(prospect_History.date)).first_or_404()
        return render_template('manage/pages/edit_prospect.html', client=client,history=client_history,form=form)

@users.route('/update/<int:id>/prospect', methods=['POST', 'PUT'])#fix pages for action on form
@login_required
def update_prospect(id):
    if current_user.TYPE == "Admin":
        client = prospect.query.filter_by(id=id).first_or_404()
        if request.form['Ville'] or  request.form['Pays'] or request.form['CP'] or  request.form['Adresse'] :
            client_check=prospect_History(prospect=id)
            db.session.add(client_check)
            db.session.commit()
            client_history=prospect_History.query.filter_by(prospect=id).order_by(asc(prospect_History.date)).first_or_404()
            client_history.ville = request.form['Ville']
            client_history.pays = request.form['Pays']
            client_history.cp = request.form['CP']
            client_history.adresse = request.form['Adresse']
            db.session.commit()
        client.email = request.form['email']
        #client.siret = request.form['Siret']
        client.societe = request.form['Societe']
        client.numero = request.form['Numero']
        client.sexe = request.form['Sexe']
        client.TYPE = request.form['Type']
        client.nom = request.form['NOM']
        

        db.session.commit()
        flash(f'Les donnes du negotiateur a été modifiées','success')
        return redirect(url_for('users.prospect_'))
    return redirect(url_for('users.edit_prospect', id=id))





@users.route('/suivi/<int:id>/prospect')
@login_required
def suivi_prospect_(id):
    if current_user.TYPE == "Admin":
        suivi_=list(suivi_prospect.query.filter(and_(suivi_prospect.prospect_id==id,suivi_prospect.visibility==True)).all()) 
        return render_template('manage/pages/suivi_c.html',Suivi=suivi_,ID=id,legend="prospect")

    return redirect(url_for('users.main'))

@users.route('/ajouter/<int:id>/suivi_propect',methods=['GET','POST'])
@login_required
def ajouter_suivip(id):
    if current_user.TYPE == "Admin":
        form=Suivi_Client() 
        client = prospect.query.filter_by(id=id).first_or_404()
        if form.validate_on_submit():
            suivi=suivi_prospect(client.id,current_user.id,form.commentaire.data)
            db.session.add(suivi)
            db.session.commit()
            flash(f'suivi prospect créé avec succès','success')
            return redirect(url_for('users.suivi_prospect_', id=id))
        return render_template('manage/pages/ajouter_suivi.html',form=form,ID=id,legend="prospect")
    #return function 

@users.route('/delete/<int:id>/suivi_propect', methods=['GET'])
@login_required
def delete_suivip(id):
    if current_user.TYPE == "Admin":
        suivi = suivi_prospect.query.filter_by(id=id).first_or_404()
        suivi.visibility=False
        db.session.commit()
        flash(f'Le suivi client a été  suprimmer','success')
        return redirect(url_for('users.suivi_prospect_', id=id))
    return redirect(url_for('users.suivi_prospect_', id=id))

@users.route('/edit/<int:id>/suivi_propect', methods=['GET'])
@login_required
def edit_suivip(id):
    if current_user.TYPE == "Admin":
        form = Suivi_Client()
        suivi = suivi_prospect.query.filter_by(id=id).first_or_404()
        if current_user.id == suivi.responsable:
            return render_template('manage/pages/edit_suivi_p.html', suivi=suivi,form=form)
        else:
            flash(f'Vous ne pouvez pas modifier ce suivi','warning')
            return redirect(url_for('users.suivi_prospect_', id=id))
    return redirect(url_for('users.client'))

@users.route('/update/<int:id>/suivi_propect', methods=['POST', 'PUT'])
@login_required
def update_suivip(id):
    if current_user.TYPE == 'Admin':
        suivi = suivi_prospect.query.filter_by(id=id).first_or_404()
        suivi.commentaire = request.form['commentaire']
        db.session.commit()
        flash(f'Le suivi a été modifiées','success')
        return redirect(url_for('users.suivi_prospect_',id=suivi.prospect_id))
    return redirect(url_for('users.client'))




@users.route("/upload", methods=['GET','POST'])
#@login_required
def up():
    
    #db.create_all()
    #expert=Expert('M','Admin','Admin','test0001@gmail.com','1234567')
    #db.session.add(expert)
    #db.session.commit()
    #ex=Expert.query.filter_by(nom="Admin").first()
    #his=Expert_History(expert_id=ex.id)
    #db.session.add(his)
    #db.session.commit()
    #expert1=Expert.query.filter_by(nom="Admin").first()
    #hashed_password = bcrypt.generate_password_hash('12345').decode('utf-8')
    #expert1.password = hashed_password
    #db.session.commit()
    #expert=Expert('esxitepas','esxitepas','esxitepas','esxitepas','esxitepas')
    ##client=Client('esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas','esxitepas')
    #db.session.add(client)
    #db.session.commit()
    return render_template('manage/pages/upload.html')




@users.route("/uploader", methods=['GET','POST'])
@login_required
def uploader_():
    if current_user.TYPE == 'Admin':
      # get the uploaded file
      if request.method == 'POST':
        uploaded_file = request.files['file']
        if uploaded_file.filename != '':
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], uploaded_file.filename)
            loc=str(file_path)
            # set the file path
            uploaded_file.save(file_path)
            # save the file
            expert__('Interv',loc)
            expert__('CONCESS',loc)
           #''' expert__('Manager_chiffrage',loc)
           # expert__('Agent_chiffrage',loc)
           # expert__('Respon Cell Dev',loc)
           # expert__('agent Cell Dev',loc)
           ## expert__('Agent CellTech',loc)
           # expert__('Respon Cell Tech',loc)
           ## expert__('Suiveur Cell Tech',loc)
           # expert__('Respon Cell Planif',loc)
           # expert__('Suiveur Cell Planif',loc)
           # expert__('Agent saisie Cell Planif',loc)'''
            insert_client('Bailleur',loc)
            insert_client('Locataire',loc)
           # insert_client('Prop',loc)
          #  Missions(loc) #learn how to check a whole row for this tables
           # mission_date(loc)
            flash(f"Vous avez importer les donnees avec success",'success')
            return redirect(url_for('users.up'))
      return redirect(url_for('users.main'))
    return redirect(url_for('users.login'))






#@users.app_errorhandler(404)
#def error_404(error):
 #   return render_template('errors/404.html'),404

#@users.app_errorhandler(403)
#def error_403(error):
 #   return render_template('errors/403.html'),403
 
#@users.app_errorhandler(500)
#def error_500(error):
 #   return render_template('errors/500.html'),500





@users.route('/search', methods=['GET'])
@login_required
def search ():
    if current_user.TYPE == 'Admin':
        table = request.args.get('table')
        search = "%{}%".format(request.args.get('keyword'))
        key=request.args.get('keyword')
        if table == 'client':
            clients = Client.query.filter(and_(or_(Client.NOM.like(search),Client.EMAIL.like(search),Client.NUMERO.like(search),Client.CP.like(search),Client.SOCIETE.like(search),Client.Visibility==True))).all()
            if len(clients) > 1:
                title = "Clients"
            else:
                title = "Client"
            return render_template('manage/pages/search_results.html', clients=clients, title=title, table=table, search=request.args.get('keyword'))
        elif table == 'tarif':
            tarifs = Tarifs.query.filter(and_(or_(Tarifs.reference_client.like(search),Tarifs.type_maison.like(search),Tarifs.Prix.like(search),Tarifs.remise.like(search)),Tarifs.visibility==False)).all()#fix reference du client eeh
            if len(tarifs) > 1:
                title = "Tarifs"
            else:
                title = "Tarif"
            return render_template('manage/pages/search_results.html', tarifs=tarifs, title=title, table=table, search=request.args.get('keyword'))
        elif table == 'expert':
            experts = Expert.query.filter(and_(or_(Expert.NOM.like(search),Expert.EMAIL.like(search),Expert.TYPE.like(search),Expert.NUMERO.like(search)),Expert.Visibility==True)).all()
            if len(experts) > 1:
                title = "Experts"
            else:
                title = "Expert"
            return render_template('manage/pages/search_results.html', experts=experts, title=title, table=table, search=request.args.get('keyword'))
        elif table == 'mission':
            try :
                if isinstance(int(key),int) == True:
                    missions= Mission.query.filter(and_(or_(Mission.DATE_REALISE_EDL.like(search),Mission.NRO_FACTURE.like(search),Mission.DATE_FACTURE.like(search),Mission.DATE_FACT_REGLEE.like(search),Mission.Reference_BAILLEUR==int(key),Mission.ID_CONCESS==int(key)),Mission.Visibility==True)).all()
            except:    
                missions = Mission.query.filter(and_(or_(Mission.DATE_REALISE_EDL.like(search),Mission.DATE_FACTURE.like(search),Mission.DATE_FACT_REGLEE.like(search)),Mission.Visibility==True)).all()
            if len(missions) > 1:
                title = "Missions"
            else:
                title = "Mission"
            return render_template('manage/pages/search_results.html', missions=missions, title=title, table=table, search=request.args.get('keyword')) 
        elif table == 'facturation':
            try :
                if isinstance(int(key),int) == True:
                   facturation_ = Facturation.query.filter(and_(or_(Facturation.Facture_no==int(key),Facturation.Pays.like(search),Facturation.Destinataire==int(key),Facturation.expéditeur==int(key),Facturation.Type.like(search)),Facturation.Visibility == True)).all()
            except:    
                facturation_ = Facturation.query.filter(and_(or_(Facturation.Pays.like(search),Facturation.Type.like(search)),Facturation.Visibility == True)).all()
            if len(facturation_) > 1:
                title = "Facturations"  #this search needs to be checked when fixing the db
            else:
                title = "Facturation"
            return render_template('manage/pages/search_results.html', Facturation__=facturation_, title=title, table=table, search=request.args.get('keyword')) 












